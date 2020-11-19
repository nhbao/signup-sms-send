class CreateReminds < ActiveRecord::Migration[6.0]
  def change
    create_table :reminds do |t|
      t.integer :user_id, null: false
      t.datetime :send_time
      t.integer :status, default: 0
    end
  end
end
