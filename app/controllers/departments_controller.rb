class DepartmentsController < ApplicationController
  before_action :set_Department, only: [:show, :update, :edit, :destroy]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
    render partial: 'form'
  end

  def create
    @department = Department.new(Department_params)
    
    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def edit
    render partial: 'form'
  end

  def update
    if @department.update(Department_params)
      redirect_to @department
      #. same as redirect_to Department_path(@Department)
    else
      render :edit
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_path
  end

  private
    
    def set_Department
      @department = Department.find(params[:id])
    end

    def Department_params
      params.require(:department).permit(:name)
    end
end
