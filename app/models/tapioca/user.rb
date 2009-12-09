class Tapioca::User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :user_roles
  has_many :roles, :through => :user_roles
  
  attr_accessible :login, :email, :password, :password_confirmation, :first_name, :last_name
  
  # Checks to see if User has any of the specified roles.
  # role_names can be a symbol, string, or array of symbols or strings.
  def has_role?(role_names)
    role_names = [role_names] unless role_names.is_a?(Array)
    role_names.map! {|name| name.to_s.downcase }
    roles.each do |role|
      return true if role_names.include?(role.name.downcase)
    end
    false # if we've gotten this far, user doesn't have role
  end

  # Returns URL for user's Gravatar. See http://gravatar.com for details.
  # Acceptible options are size, rating and default URL 
  # (returned if the user doesn't have a Gravatar).
  # For example: <tt>user.gravatar_url(:size => 100, :rating => 'X', :default => '/images/people/frank')</tt>
  def gravatar_url(opts={})
    require 'md5'
    encoded_email = MD5::md5(email.downcase)
    size = opts[:size] || 50
    rating = opts[:rating] || 'G'
    default = CGI::escape(opts[:default] || '/images/default_avatar.png')
    "http://gravatar.com/avatar/#{encoded_email}?s=#{size}&r=#{rating}&d=#{default}"
  end
  
end
