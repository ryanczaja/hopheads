class Brewery < ActiveRecord::Base
  attr_accessible :name
  has_many :beers
end
