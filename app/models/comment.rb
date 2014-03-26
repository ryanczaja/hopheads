class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :brewery
  belongs_to :beer
  attr_accessible :body, :post, :brewery, :beer

  validates :body, length: {minimum: 5}, presence: true
  validates :user, presence: true
end
