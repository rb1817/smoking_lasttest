class AdminPage < ApplicationRecord
    
  has_many :products
  has_many :qnas
  has_many :notices
  has_many :homes
  has_many :users
    
end
