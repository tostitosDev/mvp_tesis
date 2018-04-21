class MarksController < ApplicationController
  def index
    if params[:start_date] != nil || params[:end_date] != nil
      @marks = Mark.daily_marks(params[:start_date].to_datetime.beginning_of_day, params[:end_date].to_datetime.end_of_day)
    else
      @start = @start_date = Date.today.beginning_of_day
      @marks = Mark.daily_marks(@start)
    end
  end
end
