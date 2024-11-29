module ApplicationHelper
  NAV_MENUS = [
    { id: 1, name: "Home", path: :root },
    { id: 2, name: "Authors", path: :authors },
    { id: 3, name: "Author Profiles", path: :author_profiles },
    { id: 4, name: "Books", path: :books },
    { id: 5, name: "BookLoans", path: :book_loans },
    { id: 6, name: "Categories", path: :categories },
    { id: 7, name: "Genres", path: :genres },
    { id: 8, name: "Libraries", path: :libraries },
    { id: 9, name: "Members", path: :members },
    { id: 10, name: "Published Dates", path: :published_dates },
    { id: 11, name: "Publishers", path: :publishers },
    { id: 12, name: "Reviews", path: :reviews },
    { id: 13, name: "Tags", path: :tags },
    { id: 14, name: "Settings", path: :settings }
  ]

  HOME_MENU_NAME = "Home"
  SETTINGS_MENU_NAME = "Settings"
  DONT_ALLOW_REMOVE = [ HOME_MENU_NAME, SETTINGS_MENU_NAME ]

  # generate methods for each menu: home_menu, settings_menu
  DONT_ALLOW_REMOVE.each do |menu_name|
    define_method("#{menu_name.downcase.gsub(' ', '_')}_menu") do
      get_menu_by_text(menu_name)
    end
  end

  def user_settings_menus
    return nil unless session.key?(:settings)

    JSON.parse(session[:settings] || "[]") rescue []
  end

  def user_menus
    user_menu = user_settings_menus
    menus = if user_menu.nil?
      available_menus
    else
      user_menu.map do |menu|
        get_menu_by_id(menu, true)
      end
    end

    # Add the Home menu to the beginning and the Settings menu to the end.
    # menus.compact.insert(0, get_menu_by_text(HOME_MENU_NAME)).push(get_menu_by_text(SETTINGS_MENU_NAME))
  end

  def available_menus
    NAV_MENUS.reject { |menu| menu[:name].in?(DONT_ALLOW_REMOVE) }
  end

  def get_menu_by_text(text)
    NAV_MENUS.find { |menu| menu[:name] == text }
  end

  def get_menu_by_id(id, only_available = false)
    menus = only_available ? available_menus : NAV_MENUS
    menus.find { |menu| menu[:id] == id.to_i }
  end

  def get_menu_link(id)
    menu = NAV_MENUS.find { |menu| menu[:id] == id.to_i }

    return "#" if menu.blank?

    # Handle the special case for 'Home' (root_path is a special route).
    return root_path if menu[:name] == "Home"

    # Use the path symbol to dynamically generate the path helper.
    send("#{menu[:path]}_path")
  end

  def is_current_page?(menu_name, url)
    if turbo_frame_request?
      return menu_name == "Settings"
    end

    current_page?(url)
  end

  def render_menu(menu, css_class = "nav-link")
    url = get_menu_link(menu[:id])
    is_active = is_current_page?(menu[:name], url)
    link_to menu[:name], url,
      class: is_active ? "#{css_class} text-primary" : css_class,
      'aria-current': is_active ? "page" : nil,
      data: { turbo_frame: "_top" }
  end
end
