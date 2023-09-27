class IcomeTransaction < ApplicationRecord
  belongs_to :user
  has_many :icome_transactions_categories
  has_many :categories, through: :icome_transactions_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
