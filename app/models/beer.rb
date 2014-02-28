class Beer < ActiveRecord::Base
  belongs_to :brewery
  #belongs_to :post
  attr_accessible :abv, :description, :name, :style

  #validates :name, length: {minimum: 5}, presence: true
  #validates :abv, length: {minimum: 1}
  #validates :style, length: {minimum: 2}
  #validates :description, length: {minimum: 10}
end
