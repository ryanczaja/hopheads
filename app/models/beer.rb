class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :style
  has_many   :posts
  has_many   :descriptions
  has_many   :comments, dependent: :destroy
  attr_accessible :abv, :description, :name, :ibu

  before_save :title_case

  validates :name, length: {minimum: 5}, presence: true, uniqueness: true
  validates :abv, length: {minimum: 1}
  #validates :description, length: {maximum: 50}
  #validates :ibu, length: {minimum: 2}

  #This method title cases all saved entries for beer to make them singular and have no off-cased beer names.
  def title_case
  	articles = %w{a and the of}
    exceptions = %w{ipa apa}

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