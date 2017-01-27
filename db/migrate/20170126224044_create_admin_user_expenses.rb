class CreateAdminUserExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_user_expenses do |t|
    	t.string :description, null:false
      t.float :amout, null:false
      t.datetime :created_at, null:false

      t.timestamps
    end
  end
end
