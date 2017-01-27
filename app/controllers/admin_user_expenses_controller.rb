class AdminUserExpensesController < ApplicationController
  def index
  	@admin_user_expenses = current_admin_user.admin_user_expenses

  end

  def new 
    @admin_user_expense = AdminUserExpense.new
  end
	
	def show
		@admin_user_expense = AdminUserExpense.find(params[:id])
	end
	
	def edit
		@admin_user_expense = AdminUserExpense.find(params[:id])
	end
	
	def create
		@admin_user_expense = AdminUserExpense.new(admin_user_expense_params)
		@admin_user_expense.admin_user_id = current_admin_user.id
 
		if @admin_user_expense.save
			respond_to do |format|
				flash[:success] = 'Todo was successfully created.'
				format.html { redirect_to @admin_user_expense }
			end
		else
			render 'new'
		end
	end
	
	def update
		@admin_user_expense = AdminUserExpense.find(params[:id])

		if @admin_user_expense.update(admin_user_expense_params)
			respond_to do |format|
				flash[:success] = 'Todo was successfully updated.'
				format.html { redirect_to @admin_user_expense }
			end
		else
			render 'edit'
		end
	end
	
	def destroy
		@admin_user_expense = AdminUserExpense.find(params[:id])
		@admin_user_expense.destroy

		redirect_to admin_user_expenses_path
	end
	
  private 

    def admin_user_expense_params
      params.require(:admin_user_expense).permit(:description, :amount)
    end
end
