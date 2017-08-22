class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
  has_many :places
  has_many :comments
  has_many :photos
  
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  } 

  def self.find_for_database_authentication(warden_conditions)
    user=where(["lower(username) = :value OR lower(email) = :value", { :value => warden_conditions.dup[:username].downcase }]).first   
  end

end
