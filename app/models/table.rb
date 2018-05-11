class Table < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :authentication_keys => [:name]       
  validates :name, uniqueness: true
  has_many :orders, :dependent => :delete_all
  has_many :menus, :dependent => :delete_all
  
  def email_required?
    false
  end

  def email_changed?
    false
  end
  
end
