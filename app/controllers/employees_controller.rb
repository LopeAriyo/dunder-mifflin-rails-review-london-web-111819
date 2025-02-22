class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)
        if @employee.valid?
            redirect_to @employee
        else
            render :new
        end
    end    

    def show
        id = params[:id]
        @employee = Employee.find(id)
    end

    def edit
        id = params[:id]
        @employee = Employee.find(id)
    end

    def update
        id = params[:id]
        @employee = Employee.find(id)
        @employee.update(employee_params)


        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            render :edit
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
