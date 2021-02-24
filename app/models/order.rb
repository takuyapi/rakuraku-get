class Order < ApplicationRecord
  has_many :temporary_orders
  has_one :store, through: :temporary_order

  validates :total_price, numericality: { greater_than: 0 }

  def save_with_update_line_foods!(temporary_orders)
    ActiveRecord::Base.transaction do
      temporary_orders.each do |temporary_order|
        temporary_order.update_attributes!(active: false, order: self)
      end
      self.save!
    end
  end
end
