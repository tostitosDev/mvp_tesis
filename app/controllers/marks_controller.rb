class MarksController < ApplicationController
  def index
    if current_user.has_role?(:admin)
      if params[:start_date] != nil || params[:end_date] != nil
        @marks = Mark.daily_marks_filter(params[:start_date].to_datetime.beginning_of_day, params[:end_date].to_datetime.end_of_day)
      else
        @start = Date.today.beginning_of_day
        @marks = Mark.daily_marks(@start)
      end
    else
      @start = Date.today.beginning_of_day
      @employee = Employee.find_by(email: current_user.email)
      if params[:start_date] != nil || params[:end_date] != nil
        @marks = Mark.by_range(@employee, params[:start_date].to_datetime.beginning_of_day, params[:end_date].to_datetime.end_of_day)
      else  
        @marks = Mark.by_day(@employee, @start)
      end
    end
  end
end
