require 'date'

class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def weekly
    @users = User.all
    @d = Date.today
    @mon = @d.at_beginning_of_week
    @tues = @mon + 1.day
    @wed = @mon + 2.days
    @thurs = @mon + 3.days
    @fri = @mon + 4.days
    @sat = @mon + 5.days
    @sun = @mon + 6.days
    # @users.map { |user| user.schedules.build()}
    # if @users.save
    #   flash[:notice] = "Schedule saved"
    # else
    #   flash[:error] = "try again"
    #   render 'new_weekly'
    # end
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      flash[:notice] = "New Schedule added"
      redirect_to schedules_path
    else
      flash.now[:error] = "Something went wrong! try again!"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @schedule.update(schedule_params)
    flash[:notice] = "Schedule updated"
    redirect_to schedules_path
  end

  def destroy
    @schedule.destroy
    flash[:notice] = "Schedule removed"
    redirect_to schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:week, :weekday, :start_time, :end_time)
  end
end
