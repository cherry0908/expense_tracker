class ExpensesController < ApplicationController
  def index
  	@expenses = current_user.expenses

  end

  def new 
    @expense = Expense.new
  end
	
	def show
		@expense = Expense.find(params[:id])
	end
	
	def edit
		@expense = Expense.find(params[:id])
	end
	
	def create
		@expense = Expense.new(expense_params)
		@expense.user_id = current_user.id
 
		if @expense.save
			respond_to do |format|
				flash[:success] = 'Todo was successfully created.'
				format.html { redirect_to @expense }
			end
		else
			render 'new'
		end
	end
	
	def update
		@expense = Expense.find(params[:id])

		if @expense.update(expense_params)
			respond_to do |format|
				flash[:success] = 'Todo was successfully updated.'
				format.html { redirect_to @expense }
			end
		else
			render 'edit'
		end
	end
	
	def destroy
		@expense = Expense.find(params[:id])
		@expense.destroy

		redirect_to expenses_path
	end
	
  private 

    def expense_params
      params.require(:expense).permit(:description, :amount)
    end

end
