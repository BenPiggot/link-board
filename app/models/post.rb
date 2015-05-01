class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments
  has_many :votes, as: :votable


  validates :title,
      presence: true,
      length: {minimum: 10, maximum: 100}

  validates :link,
      presence: true


# validates :link, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }

end
