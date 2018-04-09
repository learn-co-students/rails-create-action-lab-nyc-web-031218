class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  end

  def create
    # if !Student.find_or_create_by(first_name: params[:first_name], last_name: params[:last_name]).error?
    if !params[:student]
    @student = Student.find_or_create_by(first_name: params[:first_name], last_name: params[:last_name])
  else
    @student = Student.find_or_create_by(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
  end
  # end
    redirect_to student_path(@student)
  end

end
