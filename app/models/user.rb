
class User < ActiveRecord::Base

  has_secure_password

  # posts by this user
  has_many :posts

  # comments by this user
  has_many :comments

  # votes ABOUT this user
  has_many :votes, as: :votable

  # votes cast by the user
  has_many :ratings, class_name: 'Vote'

   validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :password,
    presence: true,
    :on => :create

  validates :name,
    presence: true,
    length: {maximum: 20},
    :on => :create


  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
