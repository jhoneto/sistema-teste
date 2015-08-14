class StudentsController < ApplicationController

  before_filter :set_student, only: [:edit, :update, :destroy]
  autocomplete :student, :name
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to(@student, flash:{ notice: t('messages.save', model_name: t('activerecord.models.student'))  } )
    else
      render 'new'
    end
  end

  def update
    @student.assign_attributes(student_params)
    if @student.save
      redirect_to(@student, flash:{ notice: t('messages.save', model_name: t('activerecord.models.student')) })
    else
      render "edit"
    end
  end

  def destroy
    if @student.destroy
      redirect_to(students_url, flash:{ notice: t('messages.destroy', model_name: t('activerecord.models.student')) })
    else
      redirect_to(students_url, flash:{ notice: t('messages.not_destroy', model_name: t('activerecord.models.student')) })
    end
  end

  private

    def student_params
      params.require(:student).permit(:name, :register_number, :status)
    end

    def set_student
      @student = Student.find(params[:id])
    end
end
