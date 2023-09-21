require 'application_system_test_case'

class IcomeTransactionsTest < ApplicationSystemTestCase
  setup do
    @icome_transaction = icome_transactions(:one)
  end

  test 'visiting the index' do
    visit icome_transactions_url
    assert_selector 'h1', text: 'Icome transactions'
  end

  test 'should create icome transaction' do
    visit icome_transactions_url
    click_on 'New icome transaction'

    fill_in 'Amount', with: @icome_transaction.amount
    fill_in 'Name', with: @icome_transaction.name
    fill_in 'User', with: @icome_transaction.user_id
    click_on 'Create Icome transaction'

    assert_text 'Icome transaction was successfully created'
    click_on 'Back'
  end

  test 'should update Icome transaction' do
    visit icome_transaction_url(@icome_transaction)
    click_on 'Edit this icome transaction', match: :first

    fill_in 'Amount', with: @icome_transaction.amount
    fill_in 'Name', with: @icome_transaction.name
    fill_in 'User', with: @icome_transaction.user_id
    click_on 'Update Icome transaction'

    assert_text 'Icome transaction was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Icome transaction' do
    visit icome_transaction_url(@icome_transaction)
    click_on 'Destroy this icome transaction', match: :first

    assert_text 'Icome transaction was successfully destroyed'
  end
end
