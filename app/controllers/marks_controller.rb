class MarksController < ApplicationController
  def index
    if params[:start_date] != nil || params[:end_date] != nil
      puts 'jelou'
    else
      @start = @start_date = Date.today.beginning_of_day
      @marks = Mark.daily_marks(@start)
    end
  end
end
