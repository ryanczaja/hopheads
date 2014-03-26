class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many   :posts
  has_many   :descriptions
  has_many   :comments, dependent: :destroy
  attr_accessible :abv, :description, :name, :style, :ibu

  before_save :title_case

  validates :name, length: {minimum: 5}, presence: true, uniqueness: true
  validates :abv, length: {minimum: 1}
  validates :style, length: {minimum: 2}
  #validates :description, length: {minimum: 10}
  #validates :ibu, length: {minimum: 2}

  #This method title cases all saved entries for beer to make them singular and have no off-cased beer names.
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
