class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, 
         :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :provider, :uid
  # attr_accessible :title, :body

  has_many :posts
  has_many :comments

  before_create :set_member

  #Used for Facebook Users. Looks up if the user is in the database and signs them in. If not it creates a new record of that user for a later login.
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      pass = Devise.friendly_token[0,20]
      user = User.new(name: auth.extra.raw_info.name, provider: auth.provider, uid: auth.uid,
        email: auth.info.email, password: pass, password_confirmation: pass)
      user.skip_confirmation!
      user.save
    end
    user
  end

  #Looks up the users assigned role.
  ROLES = %w[member moderator admin]
  def role?(base_role)
  	role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  private

  #Used to assign new users the role of member.
  def set_member
  	self.role = 'member'
  end
end
