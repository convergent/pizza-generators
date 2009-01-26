  def collection
    @collection ||= end_of_association_chain.paginate(:page => params[:page])
  end
