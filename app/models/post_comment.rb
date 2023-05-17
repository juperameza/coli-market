class PostComment < ApplicationRecord
  belongs_to :post, dependent: :destroy
  belongs_to :user
  validates :ranking, inclusion: { in: 0..5 }
end
