class CreateDefaultRoles < ActiveRecord::Migration
  DEFAULT_ROLES = %w( Admin Developer )

  def self.up
    DEFAULT_ROLES.each do |role_name|
      Role.create! :name => role_name
    end
  end
  
  def self.down
    DEFAULT_ROLES.each do |role_name|
      Role.find_or_create_by_name(role_name).destroy
    end
  end
end
