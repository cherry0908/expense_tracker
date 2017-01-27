class AdminUserReportsController < ApplicationController
  def index
  	@admin_user_expenses = current_admin_user.admin_user_expenses.where(nil)
  	Rails.logger.debug @admin_user_expenses.count
  	# current_user.expenses.group("DATE_TRUNC('day', created_at)").count

		if params[:filter_by].present?
			if params[:filter_by][:start_date].present? && params[:filter_by][:end_date].present?
				start_date = Date.new(params[:filter_by][:start_date][0].to_i, params[:filter_by][:start_date][1].to_i, params[:filter_by][:start_date][2].to_i)
				end_date = Date.new(params[:filter_by][:end_date][0].to_i, params[:filter_by][:end_date][1].to_i, params[:filter_by][:end_date][2].to_i)
				Rails.logger.debug start_date
				Rails.logger.debug end_date
				@admin_user_expenses = current_admin_user.admin_user_expenses.where("created_at between (?) and (?)", start_date.to_time, end_date.to_time)
			end
		end


  end
end
