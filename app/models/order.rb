class Order < ActiveRecord::Base
  has_many :menus, :dependent => :delete_all
  belongs_to :table
end
