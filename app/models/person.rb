class Person < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :credit
  validates_numericality_of :credit
  
  has_many :expenses
  
  def update_derived
    credit = 0
    expenses.each do |e|
      credit += e.price
    end
    save
  end
  
end
