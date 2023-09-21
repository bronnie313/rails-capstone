class Category < ApplicationRecord
  belongs_to :user
  has_many :icome_transactions_categories
  has_many :icome_transactions, through: :icome_transactions_categories
end
