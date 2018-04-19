class DashboardsController < ApplicationController
  def index
    @correct  = Mark.select(:employee_id).distinct.where(type_mark: 1, aasm_state: 'correct', date_time_mark: Date.today.at_beginning_of_day..Date.today.at_end_of_day)
    @delayed  = Mark.select(:employee_id).distinct.where(type_mark: 1, aasm_state: 'delayed')
    @out      = Mark.select(:employee_id).distinct.where(type_mark: 1, aasm_state: 'out')
    @away     = Mark.select(:employee_id).distinct.where(type_mark: 1, aasm_state: 'away')
  end
end
