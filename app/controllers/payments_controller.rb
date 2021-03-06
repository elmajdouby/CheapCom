class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  after_action :set_authorize, except: :index
  before_action :set_subscription
  before_action :format
  # GET /payments
  def index
    @subscriptions = Subscription.all
    @payments = Payment.all
  end

  # GET /payments/1
  def show
  end

  # GET /payments/new
  def new
    @payment = @subscription.payments.build
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  def create
    @payment = Payment.new(payment_params)
    @payment.subscription = @subscription
    @payment.user = current_user
    if @payment.save
      redirect_to subscriptions_path, notice: 'Payment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      redirect_to subscription_payments_path(@subscription), notice: 'Payment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /payments/1
  def destroy
    @payment.destroy
    redirect_to subscriptions_path, notice: 'Payment was successfully destroyed.'
  end

  private

    def format
      respond_to do |format|
        format.html
        format.js
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end
    def set_subscription
      @subscription = Subscription.find(params[:subscription_id])
    end
    # Only allow a trusted parameter "white list" through.
    def payment_params
      params.require(:payment).permit(:webtransaction, :amount, :subscription_id, :type_id, :user_id)
    end
  def set_authorize
    authorize @payment
  end
end
