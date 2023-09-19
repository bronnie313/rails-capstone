class IcomeTransaction < ApplicationRecord
  belongs_to :user
  has_many :icome_transactions_categories
  has_many :categories, through: :icome_transactions_categories
end
