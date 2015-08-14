class ClassroomsController < ApplicationController
  before_filter :set_classroom, only: [:edit, :update, :destroy]
  def index
    @classrooms = Classroom.all.includes(:student, :course)
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end

  def show
    @classroom = Classroom.find(params[:id])
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      redirect_to @classroom
    else
      render 'new'
    end
  end

  def update
    @classroom.assign_attributes(classroom_params)
    if @classroom.save
      redirect_to(@classroom)
    else
      render "edit"
    end
  end

  def destroy
    @classroom.destroy
    redirect_to classrooms_url
  end

  private

    def classroom_params
      params.require(:classroom).permit(:name, :register_number, :status)
    end

    def set_classroom
      @classroom = Classroom.find(params[:id])
    end
end
