namespace :tapioca do

  desc "updates necessary files, plugins, gems and database."
  task :update => [
                    :environment,
                    'update:plugins', 
                    'update:files'
                  ]
  
  namespace :update do
    
    desc "Installs plugins."
    task :plugins do
      #TODO: install plugin
    end
    
    desc "Copies required files."
    task :files do
      sync_dirs.each do |from, to|
        puts "Copying files from #{from} to #{to}"
        `rsync -ruv #{from} #{to}`
      end
    end
    
  end

end

def default_plugins
  []
end

def sync_dirs
  [
    ["#{plugin_root}/public/", "#{RAILS_ROOT}/public/"],
    ["#{plugin_root}/db/migrate/", "#{RAILS_ROOT}/db/migrate/"]
  ]
end

def plugin_root
  "#{File.dirname(__FILE__)}/.."
end

