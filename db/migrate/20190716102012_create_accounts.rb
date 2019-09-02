class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :account_name
      t.uuid :user_id

      t.timestamps
    end
  end
end
