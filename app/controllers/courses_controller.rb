class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(:id => params[:id])
    @meetings = Meeting.where(:course_id=>params[:id])
  end

  def new
  end

  def create
    @course = Course.new
    @course.department = params[:department]
    @course.number = params[:number]
    @course.title = params[:title]
    
    if @course.save
      redirect_to courses_url
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find_by(:id => params[:id])
  end

  def update
    @course = Course.find_by(:id => params[:id])
    @course.department = params[:department]
    @course.number = params[:number]
    @course.title = params[:title]
    
    if @course.save
      redirect_to courses_url
    else
      render 'new'
    end
  end

  def destroy
    @course = Course.find_by(:id => params[:id])
    @course.destroy
    redirect_to courses_url
  end
end
