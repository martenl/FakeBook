class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :sent_messages, :class_name=>'Message', :foreign_key => 'sender_id'
  has_many :received_messages, :class_name =>'Message', :foreign_key => 'receiver_id'  
  has_many :friends, :through => :friendships
  has_many :friendships, :foreign_key => 'from_id'
  has_many :received_friendshiprequests, :class_name => 'Friendshiprequest', :foreign_key => :to_id
  has_many :sent_friendshiprequests, :class_name => 'Friendshiprequest', :foreign_key => :from_id
  validates :email, :uniqueness => true
  
  def get_name
    return name + " "+familyname
  end
  
  def is_friend(id)
    return friends.where("users.id = ?",id).length == 1
  end
  
  def was_friendshiprequested(id)
    return received_friendshiprequests.where("from_id = ?",id).length == 1
  end
  
  def is_friendshiprequested(id)
    return sent_friendshiprequests.where("to_id = ?",id).length == 1
  end
  
end
