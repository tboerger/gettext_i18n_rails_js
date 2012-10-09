namespace :gettext do
  desc "Convert PO files to js files in app/assets/locales"
  task :po_to_json => :environment do
    require 'po_to_json'

    GettextI18nRails::JsAndCoffeeParser.js_gettext_function = js_gettext_function

    po_files = Dir["#{locale_path}/**/*.po"]
    if po_files.empty?
      puts "Could not find any PO files in #{locale_path}. Run 'rake gettext:find' first."
    end

    js_locales = File.join(Rails.root, 'app', 'assets', 'javascripts', 'locale')
    FileUtils.makedirs(js_locales)
    
    po_files.each do |po_file|
      # Language is used for filenames, while language code is used
      # as the in-app language code. So for instance, simplified chinese will
      # live in app/assets/locale/zh_CN/app.js but inside the file the language
      # will be referred to as locales['zh-CN']
      # This is to adapt to the existing gettext_rails convention.
      language = File.basename( File.dirname(po_file) )
      language_code = language.gsub('_','-')

      destination = File.join(js_locales, language)
      json_string = PoToJson.new(po_file).generate_for_jed(language_code)

      FileUtils.makedirs(destination)
      File.open(File.join(destination, 'app.js'), 'w'){ |file| file.write(json_string) }

      puts "Created app.js in #{destination}"
    end
    puts
    puts "All files created, make sure they are being added to your assets file."
    puts "If they are not, you can add them with this line:"
    puts "//= require_tree ./locale"
    puts
  end

  def files_to_translate
    puts 'translate these files'
    Dir.glob("{app,lib,config,#{locale_path}}/**/*.{rb,erb,haml,slim,js,coffee,handlebars}")
  end
 
  # The parser will use this as the function basename when parsing translations.
  def js_gettext_function
    '__'
  end
end

