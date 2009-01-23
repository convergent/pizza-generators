class <%= class_name %> < ActiveRecord::Base

  # Default validations:
  exclude_validations = %w{id created_at updated_at}
  columns.each do |column|
    unless exclude_validations.include?(column.name)
      validates_presence_of column.name unless column.null
      validates_numericality_of column.name, :allow_blank => column.null if column.number?
      validates_length_of column.name, :maximum => column.limit, :allow_blank => column.null if column.limit
    end
  end

  <%- (attrs = attributes.select{|it|it.name =~ /_id$/}).each_with_index do |a, index| -%>
  <%- if index == 0 -%>
  # Only belongs_to can be guessed, uncomment if correct and don't forget to
  # define has_many on the other side of the relation.
  <%- end -%>
  # belongs_to :<%= a.name.sub(/_id$/,'') %><%= ", :polymorphic => true" unless attributes.select{|it|it.name==a.name.sub(/_id$/, '_type')}.empty? %><%= ", :counter_cache => true" unless attributes.select{|it|it.name==a.name.sub(/_id$/, '_count')}.empty? %>
  <%- end -%>

end
