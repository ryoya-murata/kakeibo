class Book < ApplicationRecord
    
    validates :year, presence: true
    validates :month, presence: true
    validates :inout, presence: true
    validates :category, presence: true
    validates :amount, presence: true
    
end
