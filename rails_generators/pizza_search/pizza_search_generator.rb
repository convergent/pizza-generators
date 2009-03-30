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
      puts @name 
      @attributes.each { |attribute| puts @attribute }
    end
  end
  
  def model_columns_for_attributes
    class_name.constantize.columns.reject do |column|
      column.name.to_s =~ /^(id|created_at|updated_at)$/
    end
  end
end