class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_selection
  belongs_to :postage_payer_selection
  belongs_to :prefecture_selection
  belongs_to :condition_selection
  belongs_to :preparation_day_selection

  with_options presence: true do
    validates :name
    validates :introduction
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  with_options numericality: { other_than:1 } do
    validates :condition_id
    validates :category_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :preparation_day_id
  end
end
