class Admins::DepartmentsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def create
    department = Department.new(department_params)
    department.save
    redirect_to admins_departments_path
  end

  def index
    @department = Department.new
    @departments = Department.all.page(params[:page]).per(10)
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    department = Department.find(params[:id])
    department.update(department_params)
    redirect_to admins_departments_path
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
  
end
