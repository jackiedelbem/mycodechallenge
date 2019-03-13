class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :user_id, null: false, index: true
      t.string :description, null: false
      t.decimal :current_balance, null: false, precision: 64, scale: 4, default: 0

      t.timestamps
    end
  end
end
