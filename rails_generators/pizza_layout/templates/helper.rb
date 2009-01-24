# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args.map(&:to_s)) }
  end
  
  def javascript(*args)
    args = args.map { |arg| arg == :defaults ? arg : arg.to_s }
    content_for(:head) { javascript_include_tag(*args) }
  end

  def tab(identifier)
    @current_tab = identifier
  end

  def show_tab(identifier, link = "#", link_options = {}, list_options = {})
    text = t(identifier, :scope => :tabs, :default => identifier.to_s.titleize)
    list_options[:class] = :current if identifier == @current_tab
    content_tag(:li, link_to(text, link, link_options), list_options)
  end

  def cancel_link
    if session[:back]
      link = link_to(t(:cancel), session[:back], :confirm => h(t(:confirm_cancel)))
      content_tag(:small, link, :class => "cancel")
    end
  end

end
