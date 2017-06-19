class Pawn < ApplicationRecord
  validates :pawn_number, presence: true,
                    length: { minimum: 5 }
  validates :name, presence: true,
                      length: { minimum: 5 }                    
end
