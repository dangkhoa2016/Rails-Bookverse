module LibrariesHelper
  def libraries_options_for_select
    Library.all.map do |library|
      [library.name, library.id]
    end
  end
end
