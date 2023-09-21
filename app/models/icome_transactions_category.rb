class IcomeTransactionsCategory < ApplicationRecord
  belongs_to :icome_transaction
  belongs_to :category
end
