module ApplicationHelper
  include Pagy::Frontend

  NAV_MENUS = [
    { id: 1, name: 'home', path: :root, icon: 'cil-home' },
    { id: 2, name: 'authors', path: :authors, group: 'authors', icon: 'cil-user' },
    { id: 3, name: 'author_profiles', path: :author_profiles, group: 'authors', icon: 'cil-address-book' },
    { id: 4, name: 'books', path: :books, group: 'books', icon: 'cil-book' },
    { id: 5, name: 'book_loans', path: :book_loans, group: 'rentals', icon: 'cil-cart' },
    { id: 6, name: 'categories', path: :categories, group: 'books', icon: 'cil-blur' },
    { id: 7, name: 'genres', path: :genres, group: 'books', icon: 'cil-camera-control' },
    { id: 8, name: 'libraries', path: :libraries, group: 'rentals', icon: 'cil-library' },
    { id: 9, name: 'members', path: :members, group: 'rentals', icon: 'cil-people' },
    { id: 10, name: 'published_dates', path: :published_dates, group: 'publications', icon: 'cil-calendar' },
    { id: 11, name: 'publishers', path: :publishers, group: 'publications', icon: 'cil-building' },
    { id: 12, name: 'reviews', path: :reviews, group: 'books', icon: 'cil-star' },
    { id: 13, name: 'tags', path: :tags, group: 'books', icon: 'cil-tags' },
    { id: 14, name: 'settings', path: :settings, icon: 'cil-settings', group: 'settings' }
  ]

  VIEW_TYPES = [{
    name: 'list',
    icon: 'cil-list',
  }, {
    name: 'table',
    icon: 'cil-description',
  },{
    name: 'card',
    icon: 'cil-grid',
  }]

  HOME_MENU_NAME = 'home'
  SETTINGS_MENU_NAME = 'settings'
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
    return root_path if menu[:name] == 'home'

    # Use the path symbol to dynamically generate the path helper.
    send("#{menu[:path]}_path")
  end

  def is_current_page?(menu_name, url)
    if turbo_frame_request?
      return menu_name == 'settings'
    end

    current_page?(url)
  end

  def locale_switch_url(locale)
    action = action_name
    if action == 'create'
      action = 'new'
    elsif action == 'update'
      action = 'edit'
    end
    url_for(locale: locale, action: action)
  end

  def view_type
    @view_type ||= begin
      default_view_type = cookies[:view_type].presence || 'list'
      if action_name == 'index'
        default_view_type
      else
        request.query_parameters[:view].presence || default_view_type
      end
    end
  end

end
