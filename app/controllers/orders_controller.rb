class OrdersController < ApplicationController
before_action :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.where(:trigger=> false).order('created_at DESC')
  end
  
  def new
    @menus = MenuName.all
  end

  def create
    @menus = MenuName.all
    new_order = Order.new(table_id: current_table.id)
    if new_order.save
      @menus.each do |menu| 
        new_menu = Menu.new(order_id: new_order.id, name: params[:"menu#{menu.id}"], count: params[:"count#{menu.id}"])
        new_menu.save
      end
      redirect_to orders_path, notice: "주문 완료"         
    else 
      redirect_to orders_path, notice: "주문에 실패하였습니다"    
    end
  end

  def show

  end

  def edit
    
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path, notice: "주문 수정 완료"   
    else
      render 'edit'
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: "주문이 삭제되었습니다"
  end
  
  def trigger
    @order = Order.find_by(id: params[:order_id])
    if @order.trigger == true
      redirect_to orders_path, notice: "이미 처리된 주문입니다"
    elsif @order.trigger == false
      @order.update_attribute(:trigger,true)
      redirect_to orders_path, notice: "주문 처리 완료"
    elsif @order.user.trigger == nil
      @order.update_attribute(:trigger,true)
      redirect_to orders_path, notice: "주문 처리 완료"
    else
      redirect_to :back
    end      
  end 
  
  
  private

  def load_object
    @order = Order.find params[:id]
  end


  
end
