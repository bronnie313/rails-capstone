class IcomeTransactionsController < ApplicationController
  before_action :set_icome_transaction, only: %i[show edit update destroy]

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

        format.html do
          redirect_to category_icome_transactions_path(category), notice: 'Income transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @icome_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @icome_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @icome_transaction.icome_transactions_categories.destroy_all
    @icome_transaction.destroy

    respond_to do |format|
      format.html do
        redirect_to category_icome_transactions_path, notice: 'Income transaction was successfully destroyed.'
      end
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
