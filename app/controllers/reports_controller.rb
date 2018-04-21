class ReportsController < ApplicationController
  def index
    @employees  = Employee.all
  end

  def show
    @summary    = {}
    @employee   = Employee.find(params[:employee_id])
    @start_date = params[:start_date] || Date.today.at_beginning_of_month 
    @end_date   = params[:end_date] || @start_date.end_of_month

    (@start_date.to_date..@end_date.to_date).each do |day|
      @marks    = Mark.includes(:employee_schedule).by_day(@employee, day)
      if !@marks.blank?
        @summary[:"#{day}"] = daily_summary @marks, day
      else
        @summary[:"#{day}"] = {}
      end
    end
  end

  def daily_summary(marks, day)
    daily_summary = {}
    marks.each do |mark|
      case mark.type_mark_id 
      when 1    
        #entrada
        daily_summary[:time_in] = mark.date_time_mark.strftime("%H:%M:%S")
      when 2    
        #salida colacion
        daily_summary[:time_out_collation] = mark.date_time_mark.strftime("%H:%M:%S")
      when 3
        #entrada colacion
        daily_summary[:time_in_collation] = mark.date_time_mark.strftime("%H:%M:%S")
      when 4
        #salida
        daily_summary[:time_out] = mark.date_time_mark.strftime("%H:%M:%S")
      end
    end
    daily_summary[:collation_time] = calculate_collation daily_summary
    daily_summary[:work_time] = calculate_work daily_summary
    daily_summary[:no_work_time] = calculate_no_work daily_summary, day, marks[0].employee_schedule_id
    daily_summary
  end

  def calculate_collation daily_summary
    return '' unless daily_summary.has_key?(:time_in_collation) 
    return '' unless daily_summary.has_key?(:time_out_collation)
    return time_diff(daily_summary[:time_in_collation].to_time, daily_summary[:time_out_collation].to_time)
  end

  def calculate_work daily_summary
    return '' unless daily_summary.has_key?(:time_in) 
    return '' unless daily_summary.has_key?(:time_out)
    return '' if daily_summary[:collation_time] == ''
    return '' unless daily_summary.has_key?(:collation_time)
    work_withouth_collation = time_diff(daily_summary[:time_out].to_time, daily_summary[:time_in].to_time)
    collation_time = Time.parse(daily_summary[:collation_time])
    collation_time_seconds = collation_time.hour * 60 * 60 + collation_time.min * 60 + collation_time.sec

    return (work_withouth_collation.to_time - collation_time_seconds.seconds).strftime("%H:%M:%S")
  end

  def time_diff start_time, end_time
    seconds_diff = (start_time - end_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end

  def calculate_no_work daily_summary, day, schedule
    return '' if daily_summary[:work_time] == ''
    @day_c = day.strftime("%A")
    @schedule = EmployeeSchedule.find(schedule)
    @detail_day = DetailSchedule.where(schedule_id: @schedule.schedule_id, day: @day_c).first!
    diff = time_diff @detail_day.work_time.to_time, daily_summary[:work_time].to_time
    if daily_summary[:work_time] >= @detail_day.work_time
      return '00:00:00'
    else
      return diff
    end
  end
end
