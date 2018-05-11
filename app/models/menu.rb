class Menu < ActiveRecord::Base
  belongs_to :table
  belongs_to :order
end
