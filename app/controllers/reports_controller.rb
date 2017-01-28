class ReportsController < ApplicationController
  def index
  	@expenses = current_user.expenses.where(nil).order('created_at asc')
  	@day_report = current_user.expenses.group("DATE_TRUNC('week', created_at)").sum(:amount)

		if params[:filter_by].present?
			if params[:filter_by][:start_date].present? && params[:filter_by][:end_date].present?
				start_date = Date.new(params[:filter_by][:start_date][0].to_i, params[:filter_by][:start_date][1].to_i, params[:filter_by][:start_date][2].to_i)
				end_date = Date.new(params[:filter_by][:end_date][0].to_i, params[:filter_by][:end_date][1].to_i, params[:filter_by][:end_date][2].to_i)
				Rails.logger.debug start_date
				Rails.logger.debug end_date
				@expenses = current_user.expenses.where("created_at between (?) and (?)", start_date.to_time, end_date.to_time)
			end
		end
		
  end
end
