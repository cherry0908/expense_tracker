class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :expenses, :amout, :amount
  	rename_column :admin_user_expenses, :amout, :amount
  end
end
