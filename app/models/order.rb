class Order
  has_one :receiver
  belongs_to :user
  belongs_to :item
end