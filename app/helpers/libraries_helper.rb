module LibrariesHelper
  def libraries_options_for_select
    Library.active.map do |library|
      [library.name, library.id]
    end
  end
end
