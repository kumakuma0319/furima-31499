class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage_payer
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :preparation_day

  with_options presence: true do
    validates :name
    validates :introduction
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { other_than: 1 } do
    validates :condition_id
    validates :category_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :preparation_day_id
  end
end
