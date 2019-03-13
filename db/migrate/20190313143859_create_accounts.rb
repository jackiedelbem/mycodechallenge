class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.decimal :current_balance

      t.timestamps
    end
  end
end
