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

  validates :name, presence: true
  validates :introduction, presence: true
  validates :condition_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :postage_payer_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :preparation_day_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :image, presence: true

end
