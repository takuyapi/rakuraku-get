class Store < ApplicationRecord
  has_many :foods
  has_many :temporary_orders, through: :foods
  belongs_to :order, optional: true

  validates :name, presence: true
  validates :name, length: { maximum: 30 }
end
