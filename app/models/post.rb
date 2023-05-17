class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_many :orders, through: :order_details
  has_many :order_details
  has_and_belongs_to_many :carts

  has_many :schedules
  has_many :reservations
  has_many_attached :picture
  belongs_to :user
  has_many :favorites

  scope :active, -> { where(:status_id => 1)}
  # Ex:- scope :active, -> {where(:active => true)}

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :delivery, presence: true
  validates :picture, presence: true
  validates :title, length: { maximum: 30 }
  validates :city, presence: true

  enum delivery: {
    "Entrega a domicilio": 0,
    "Retiro en tienda": 1,
    "Punto medio": 2
  }

  enum city: {
    "Armería": 0,
    "Colima": 1,
    "Comala": 2,
    "Coquimatlán": 3,
    "Cuauhtemoc": 4,
    "Ixtlahuacán": 5,
    "Manzanillo": 6,
    "Minatitlán": 7,
    "Tecomán": 8,
    "Villa de Álvarez": 9
  }

  def get_ranking
    self.post_comments.average(:ranking)
  end
  def self.delete(post)
    Post.where(id: post.id).update(status_id: 2)
  end
  SEARCH_ATTRS = %i[title description]
  scope :search_query, lambda { |query| self.class.search(query) }
  def self.search(search)
    results = []
    SEARCH_ATTRS.each do |attr|
      results += self.where("#{attr} ~* ?", search.to_s)
    end
    results.uniq
  end

  def owner?(current_user)
    self.user == current_user
  end
end
