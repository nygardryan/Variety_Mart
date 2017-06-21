class Pawn < ApplicationRecord
  has_many :payments, dependent: :destroy
  validates :pawn_number, presence: true,
                    length: { minimum: 5 }
  validates :name, presence: true,
                      length: { minimum: 5 }                    
end
