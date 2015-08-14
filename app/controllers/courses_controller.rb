class CoursesController < ApplicationController
  before_filter :set_course, only: [:edit, :update, :destroy]
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def show
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to(@course, flash:{ notice: t('messages.save', model_name: t('activerecord.models.course'))  })
    else
      render 'new'
    end
  end

  def update
    @course.assign_attributes(course_params)
    if @course.save
      redirect_to(@course, flash:{ notice: t('messages.save', model_name: t('activerecord.models.course'))  } )
    else
      render "edit"
    end
  end

  def destroy
    if @course.destroy
      redirect_to(courses_url, flash:{ notice: t('messages.destroy', model_name: t('activerecord.models.course')) })
    else
      redirect_to(courses_url, flash:{ notice: t('messages.not_destroy', model_name: t('activerecord.models.course')) })
    end
  end

  private

    def course_params
      params.require(:course).permit(:name, :description, :status)
    end

    def set_course
      @course = Course.find(params[:id])
    end
end
