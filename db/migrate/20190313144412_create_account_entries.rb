class CreateAccountEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :account_entries do |t|
      t.integer :account_id, null: false, index: true
      t.integer :entry_type,  null: false, default: 0
      t.decimal :amount, null: false, precision: 64, scale: 4

      t.timestamps
    end
  end
end
