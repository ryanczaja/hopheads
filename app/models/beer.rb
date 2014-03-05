class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many   :posts
  has_many :descriptions
  attr_accessible :abv, :description, :name, :style

  validates :name, length: {minimum: 5}, presence: true, uniqueness: true
  validates :abv, length: {minimum: 1}
  validates :style, length: {minimum: 2}
  validates :description, length: {minimum: 10}
end
