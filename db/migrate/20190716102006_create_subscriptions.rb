class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :account_id

      t.timestamps
    end
  end
end
