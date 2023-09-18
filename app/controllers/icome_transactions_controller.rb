class IcomeTransactionsController < ApplicationController
  before_action :set_icome_transaction, only: %i[show edit update destroy]

  # GET /icome_transactions or /icome_transactions.json
  def index
    @icome_transactions = IcomeTransaction.all
  end

  # GET /icome_transactions/1 or /icome_transactions/1.json
  def show; end

  # GET /icome_transactions/new
  def new
    @icome_transaction = IcomeTransaction.new
  end

  # GET /icome_transactions/1/edit
  def edit; end

  # POST /icome_transactions or /icome_transactions.json
  def create
    @icome_transaction = IcomeTransaction.new(icome_transaction_params)

    respond_to do |format|
      if @icome_transaction.save
        format.html do
          redirect_to icome_transaction_url(@icome_transaction), notice: 'Icome transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @icome_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @icome_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icome_transactions/1 or /icome_transactions/1.json
  def update
    respond_to do |format|
      if @icome_transaction.update(icome_transaction_params)
        format.html do
          redirect_to icome_transaction_url(@icome_transaction), notice: 'Icome transaction was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @icome_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @icome_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icome_transactions/1 or /icome_transactions/1.json
  def destroy
    @icome_transaction.destroy

    respond_to do |format|
      format.html { redirect_to icome_transactions_url, notice: 'Income transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_icome_transaction
    @icome_transaction = IcomeTransaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def icome_transaction_params
    params.require(:icome_transaction).permit(:name, :amount, :user_id)
  end
end
