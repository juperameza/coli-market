class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  has_many :orders
  has_many :posts, dependent: :destroy
  has_many :favorites
  has_many :user_comments
  has_many :post_comments, dependent: :destroy
  has_many :carts

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :avatar
  has_one_attached :cover_photo

  paginates_per 10

  def published_products
    posts.count
  end

  def sold_products
    posts.joins(:order_details).count
  end

  def bought_products
    orders.joins(:order_details).count
  end
end
