class AdminController < ApplicationController
  def index
  end
  
  def history
    @orders = Order.all.order('created_at DESC')  
  end
end
