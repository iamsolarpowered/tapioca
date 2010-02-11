ActionView::Base.send :include, TapiocaHelper

ActiveRecord::Base.send :include, Tapioca::ActiveRecord

# dirty fix to make engine models load properly in development
if ENV['RAILS_ENV'] != 'production'
  load_paths.each do |path|
    ActiveSupport::Dependencies.load_once_paths.delete(path)
  end
end
