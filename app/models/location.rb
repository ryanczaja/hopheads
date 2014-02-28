class Location < ActiveRecord::Base
  attr_accessible :address, :city, :name, :phone, :state, :zip
  has_many :breweries
end
