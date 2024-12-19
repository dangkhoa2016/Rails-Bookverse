module ApplicationHelper
  NAV_MENUS = [
    { id: 1, name: 'Home', path: :root, icon: 'cil-home' },
    { id: 2, name: 'Authors', path: :authors, group: 'Authors', icon: 'cil-user' },
    { id: 3, name: 'Author Profiles', path: :author_profiles, group: 'Authors', icon: 'cil-address-book' },
    { id: 4, name: 'Books', path: :books, group: 'Books', icon: 'cil-book' },
    { id: 5, name: 'Book Loans', path: :book_loans, group: 'Rentals', icon: 'cil-cart' },
    { id: 6, name: 'Categories', path: :categories, group: 'Books', icon: 'cil-blur' },
    { id: 7, name: 'Genres', path: :genres, group: 'Books', icon: 'cil-camera-control' },
    { id: 8, name: 'Libraries', path: :libraries, group: 'Rentals', icon: 'cil-library' },
    { id: 9, name: 'Members', path: :members, group: 'Rentals', icon: 'cil-people' },
    { id: 10, name: 'Published Dates', path: :published_dates, group: 'Publications', icon: 'cil-calendar' },
    { id: 11, name: 'Publishers', path: :publishers, group: 'Publications', icon: 'cil-building' },
    { id: 12, name: 'Reviews', path: :reviews, group: 'Books', icon: 'cil-star' },
    { id: 13, name: 'Tags', path: :tags, group: 'Books', icon: 'cil-tags' },
    { id: 14, name: 'Settings', path: :settings, icon: 'cil-settings', group: 'settings' }
  ]

  HOME_MENU_NAME = 'Home'
  SETTINGS_MENU_NAME = 'Settings'
  DONT_ALLOW_REMOVE = [HOME_MENU_NAME, SETTINGS_MENU_NAME]

  # generate methods for each menu: home_menu, settings_menu
  DONT_ALLOW_REMOVE.each do |menu_name|
    define_method("#{menu_name.downcase.gsub(' ', '_')}_menu") do
      get_menu_by_text(menu_name)
    end
  end

  def user_settings_menus
    return nil unless session.key?(:settings)

    JSON.parse(session[:settings] || '[]') rescue []
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
    
    return '#' if menu.blank?
    
    # Handle the special case for 'Home' (root_path is a special route).
    return root_path if menu[:name] == 'Home'

    # Use the path symbol to dynamically generate the path helper.
    send("#{menu[:path]}_path")
  end

  def is_current_page?(menu_name, url)
    if turbo_frame_request?
      return menu_name == 'Settings'
    end

    current_page?(url)
  end

  def render_menu(menu, css_class='nav-link')
    url = get_menu_link(menu[:id])
    is_active = is_current_page?(menu[:name], url)
    link_to menu[:name], url,
      class: is_active ? "#{css_class} text-primary" : css_class,
      'aria-current': is_active ? 'page' : nil,
      data: { turbo_frame: '_top' }
  end

  def display_columns_class(model)
    display_columns = model.respond_to?(:display_columns) ? model.display_columns : model.column_names
    display_columns.map do |column|
      if column.is_a?(Hash)
        column
      else
        { column => 'col-md-6 col-12' }
      end
    end
  end
end
