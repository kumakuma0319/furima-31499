class Order < ApplicationRecord
  has_one :receiver
  belongs_to :user
  belongs_to :item
end
