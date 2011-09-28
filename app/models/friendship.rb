class Friendship < ActiveRecord::Base
  belongs_to :user, :foreign_key => :from_id
  belongs_to    :friend, :foreign_key => :to_id, :class_name => 'User'
end