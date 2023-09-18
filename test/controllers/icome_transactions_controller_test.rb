require 'test_helper'

class IcomeTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @icome_transaction = icome_transactions(:one)
  end

  test 'should get index' do
    get icome_transactions_url
    assert_response :success
  end

  test 'should get new' do
    get new_icome_transaction_url
    assert_response :success
  end

  test 'should create icome_transaction' do
    assert_difference('IcomeTransaction.count') do
      post icome_transactions_url,
           params: { icome_transaction: { amount: @icome_transaction.amount, name: @icome_transaction.name,
                                          user_id: @icome_transaction.user_id } }
    end

    assert_redirected_to icome_transaction_url(IcomeTransaction.last)
  end

  test 'should show icome_transaction' do
    get icome_transaction_url(@icome_transaction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_icome_transaction_url(@icome_transaction)
    assert_response :success
  end

  test 'should update icome_transaction' do
    patch icome_transaction_url(@icome_transaction),
          params: { icome_transaction: { amount: @icome_transaction.amount, name: @icome_transaction.name,
                                         user_id: @icome_transaction.user_id } }
    assert_redirected_to icome_transaction_url(@icome_transaction)
  end

  test 'should destroy icome_transaction' do
    assert_difference('IcomeTransaction.count', -1) do
      delete icome_transaction_url(@icome_transaction)
    end

    assert_redirected_to icome_transactions_url
  end
end
