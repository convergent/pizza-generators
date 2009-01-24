module WillPaginate
  def self.translate!
    options = I18n.t(:pagination, :raise => true)
    WillPaginate::ViewHelpers.pagination_options.merge! options
  rescue I18n::MissingTranslationData => e
    puts e.message
  end
end
WillPaginate.translate!
