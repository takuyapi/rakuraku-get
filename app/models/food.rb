class Food < ApplicationRecord
  belongs_to :store
  belongs_to :order, optional: true
  has_one :temporary_order
end
