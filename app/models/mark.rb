class Mark < ApplicationRecord
  belongs_to :employee
  belongs_to :type_mark
  belongs_to :employee_schedule
  include AASM


  scope :by_month,  ->(employee, start) {where(employee_id: employee.id, date_time_mark: start..start.end_of_month)}

  scope :by_day,    ->(employee, day) {where(employee_id: employee.id, date_time_mark: day.beginning_of_day..day.end_of_day)}

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

