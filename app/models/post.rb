class Post < ActiveRecord::Base
  attr_accessible :title
  has_many :beers
  has_many :breweries
  has_many :locations

  belongs_to :user

  default_scope order('created_at DESC')
end
