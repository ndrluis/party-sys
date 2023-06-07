I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]

# Permitted locales available for the application
I18n.available_locales = [:en, :'pt-BR']

I18n.default_locale = :'pt-BR'
