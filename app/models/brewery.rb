class Brewery < ActiveRecord::Base
  attr_accessible :name
  has_many :beers
  has_many :posts
  belongs_to :location

  before_save :title_case

  #validates :name length: {minimum: 5}, presence: true, uniqueness: true

  def title_case
  	articles = %w{a and the of}
  	self.name = self.name.downcase.split(" ")
  	
  	self.name.each do |word|
  		unless articles.include?(word)
  			word.capitalize!
  		end
  	end

    self.name.first.capitalize!
    self.name = self.name.join(" ")
  end
end
