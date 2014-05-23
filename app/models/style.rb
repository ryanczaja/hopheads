class Style < ActiveRecord::Base
  attr_accessible :name
  has_many :beers
  has_many :posts

  before_save :title_case

  #validates :name, length: {minimum: 5}, presence: true, uniqueness: true

  #This method title cases all saved entries for beer to make them singular and have no off-cased beer names.
  def title_case
  	articles = %w{a and the of}
    exceptions = %W{ipa apa}

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
