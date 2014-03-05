class BeerDescription < ActiveRecord::Base
  attr_accessible :body
  belongs_to :beer
end
