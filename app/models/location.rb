class Location < ActiveRecord::Base
  attr_accessible :address, :city, :name, :phone, :state, :zip
  has_many :breweries

  #validates :address, length: {minimum: 5}, uniqueness: true
  #validates :city, length: {minimum: 2}
  #validates :phone, length: {minimum: 10}
  #validates :state, length: {minimum: 4}
  #validates :zip, length: {minimum: 5}
end
