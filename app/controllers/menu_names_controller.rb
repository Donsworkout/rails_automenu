class MenuNamesController < ApplicationController
before_action :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @menunames = MenuName.order('created_at ASC')
  end
  
  def new
   
  end

  def create
    new_menuname = MenuName.new(menuname_params)
    if new_menuname.save
      redirect_to menu_names_path
    else 
      redirect_to menu_names_path, notice: "메뉴 추가 실패"
    end
  end

  def show

  end

  def edit
    
  end

  def update
    if @menuname.update(menuname_params)
      redirect_to menu_names_path
    else
      render 'edit'
    end
  end

  def destroy
    @menuname.destroy
    redirect_to menu_names_path, notice: "메뉴가 삭제되었습니다"
  end
  
  private

  def menuname_params
    params.require(:menu_name).permit(:name)
  end
  
  def load_object
    @menuname = MenuName.find params[:id]
  end
  
end