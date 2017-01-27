class AddAdminUserIdToAdminUserExpenses < ActiveRecord::Migration[5.0]
  def change
    add_reference :admin_user_expenses, :admin_user, foreign_key: true
  end
end
