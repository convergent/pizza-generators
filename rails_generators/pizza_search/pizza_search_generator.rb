class PizzaSearchGenerator < Rails::Generator::Base
  include PizzaGenerators
  
  attr_accessor :name, :attributes
  
  def initialize(runtime_args, runtime_options = {})
    super
    usage if @args.empty?
    
    @name = @args.first
    
    @attributes = []
    
    @args[1..-1].each { |arg| @attributes << Rails::Generator::GeneratedAttribute.new(*arg.split(":")) }
    
    @attributes.uniq!
    
    if @attributes.empty?
      options[:skip_model] = true # default to skipping model if no attributes passed
      if model_exists?
        model_columns_for_attributes.each do |column|
          @attributes << Rails::Generator::GeneratedAttribute.new(column.name.to_s, column.type.to_s)
        end
      else
        @attributes << Rails::Generator::GeneratedAttribute.new('name', 'string')
      end
    end
  end
  
  def manifest
    record do |m|
      m.template "_search_form.html.haml", "app/views/#{plural_name}/_search.html.haml"
      
    end
  end
  
  def fields_for_model
    fields = []
    @attributes.each do |attribute|
      fields << produce_field(attribute)
    end
    fields
  end
  
  def produce_field(attribute)
    case attribute.type
    when :string 
      "    =#{plural_name}.label :#{attribute.name}_contains, t(:#{attribute.name})\n    =#{plural_name}.text_field :#{attribute.name}_contains\n"
    when :boolean
      "    =#{plural_name}.label :#{attribute.name}, t(:#{attribute.name})\n    =#{plural_name}.check_box :#{attribute.name}\n"
    when :integer
      "    =#{plural_name}.label :#{attribute.name}_gt, t(:#{attribute.name}_gt)\n           =#{plural_name}.text_field :#{attribute.name}\n"
      "    =#{plural_name}.label :#{attribute.name}_lt, t(:#{attribute.name}_lt)\n    =#{plural_name}.text_field :#{attribute.name}\n"
    when :datetime || :date
      date_name = attribute.name.gsub(/(_at|_on)$/,"")
      "    =#{plural_name}.label :#{date_name}_after, t(:#{date_name}_after)\n    =#{plural_name}.date_select :#{date_name}_after\n"
    end
  end
  
  # is there a better way to do this? Perhaps with const_defined?
  def model_exists?
    File.exist? destination_path("app/models/#{singular_name}.rb")
  end
  
  def model_columns_for_attributes
    class_name.constantize.columns.reject do |column|
      column.name.to_s =~ /^(id|created_at|updated_at)$/
    end
  end
  
  def class_name
    name.camelize
  end
  
  def singular_name
    name.underscore
  end
  
  def plural_name
    name.underscore.pluralize
  end
end