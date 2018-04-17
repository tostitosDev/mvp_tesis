class Mark < ApplicationRecord
  belongs_to :employee
  belongs_to :type_mark
  include AASM

  aasm do 
    #Marcacion correcta, atrasada, fuera de lugar o ausente.
    state :correct, initial: true
    state :delayed
    state :out
    state :away

    event :e_delayed do
      transitions from: :correct, to: :delayed
    end

    event :e_out do
      transitions from: :correct, to: :out
    end

    event :e_away do
      transitions from: :delayed, to: :away
    end
  end

end

