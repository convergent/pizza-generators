  def collection
    @<%= plural_name %> ||= <%= class_name %>.paginate(:page => params[:page], :per_page => params[:per_page])
  end
