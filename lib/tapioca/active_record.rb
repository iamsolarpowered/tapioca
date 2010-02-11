module Tapioca
  module ActiveRecord
  
    def self.included(base)
      base.class_eval do
        #attr_accessible nil        
        named_scope :limit, lambda {|limit| {:limit => limit} }
      end
    end
    
    def helpers
      ActionController::Base.helpers
    end
  end
end
