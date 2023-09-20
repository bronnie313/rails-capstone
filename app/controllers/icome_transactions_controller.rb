class IcomeTransactionsController < ApplicationController
  before_action :set_icome_transaction, :set_category, only: %i[show edit update destroy]

  def index
    @category = Category.find(params[:category_id])
    @icome_transactions = @category.icome_transactions
  end

  def show; end

  def new
    @category = Category.find(params[:category_id])
    @icome_transaction = @category.icome_transactions.build
  end

  def create
    @icome_transaction = IcomeTransaction.new(icome_transaction_params)
    @icome_transaction.user = current_user

    category_id = params[:icome_transaction][:category_id]

    respond_to do |format|
      if @icome_transaction.save
        if category_id.present?
          category = Category.find(category_id)
          @icome_transaction.categories << category
        end

        format.html { redirect_to category_icome_transactions_path(category_id), notice: 'Income transaction was successfully created.' }
        format.json { render :show, status: :created, location: @icome_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @icome_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @icome_transaction.destroy

    respond_to do |format|
      format.html { redirect_to icome_transactions_url, notice: 'Income transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_icome_transaction
    @icome_transaction = IcomeTransaction.find(params[:id])
  end

  def icome_transaction_params
    params.require(:icome_transaction).permit(:name, :amount, :user_id)
  end
end
