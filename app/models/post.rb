class Post < ActiveRecord::Base
  attr_accessible :title, :beer_attributes
  belongs_to :user
  belongs_to :beer
  belongs_to :location
  belongs_to :brewery

  has_many :comments
  has_many :beers

  accepts_nested_attributes_for :beer

  default_scope order('created_at DESC')

  validates :user, presence: true
  validates :title, length: {minimum: 5}, presence: true
end
