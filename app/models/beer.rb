class Beer < ActiveRecord::Base
  belongs_to :brewery
  attr_accessible :abv, :description, :name, :style
end
