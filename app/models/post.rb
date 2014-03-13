class Post < ActiveRecord::Base
  attr_accessor :image_file_name, :image_content_type
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
  attr_accessible :title, :beer_attributes, :brewery_attributes, :location_attributes, :image
  before_validation :lookup_beer,    if: proc { !self.beer.nil? }
  before_validation :lookup_brewery, if: proc { !self.brewery.nil? }

  belongs_to :user
  belongs_to :beer
  belongs_to :location
  belongs_to :brewery

  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :beer, :brewery, :location

  #attr_accessible :beer

  default_scope order('created_at DESC')

  validates :user, presence: true
  #validates :title, length: {minimum: 5}, presence: true
  #validates_attachment_presence :image
  #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def lookup_beer
    beer = Beer.where(name: self.beer.name).first
    self.beer = beer if beer
  end

  def lookup_brewery
    brewery = Brewery.where(name: self.brewery.name).first
    self.brewery = brewery if brewery
  end
end