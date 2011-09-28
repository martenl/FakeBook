class Friendshiprequest < ActiveRecord::Base
  belongs_to :receiver, :class_name => 'User',:foreign_key => :to_id
  belongs_to :requester,:class_name => 'User', :foreign_key => :from_id
end
