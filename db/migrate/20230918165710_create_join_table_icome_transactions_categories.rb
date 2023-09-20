class CreateJoinTableIcomeTransactionsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :icome_transactions_categories do |t|
      t.references :icome_transaction, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false
    end
  end
end
