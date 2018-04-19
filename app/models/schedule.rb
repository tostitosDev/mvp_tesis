class Schedule < ApplicationRecord
  has_many :employee_schedules
  has_many :employee, :through => :employee_schedules
  has_many :detail_schedules
end
