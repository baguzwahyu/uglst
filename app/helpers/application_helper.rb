module ApplicationHelper
  def nav_tab(name, path)
    "<li class=\"#{nav_tab_active(path)}\">#{link_to name, path}</li>".html_safe
  end

  def nav_tab_active(path)
    active_nav_tab  = URI.parse(String(request.original_url)).path.split('/').reject { |token| token.empty? }.first.try(:downcase)
    current_nav_tab = URI.parse(String(path)).path.split('/').reject { |token| token.empty? }.first.try(:downcase)

    if active_nav_tab == current_nav_tab
      'active'
    else
      ''
    end
  end
end
