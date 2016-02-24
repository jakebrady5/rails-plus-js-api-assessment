class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render 'new'
    end
  end

  def edit
    set_customer
  end

  def update
    set_customer
    @customer.update(customer_params)
    redirect_to customers_path
  end

  private
    def customer_params
      params.require(:customer).permit(:name)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

end
