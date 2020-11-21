class CreateReminds < ActiveRecord::Migration[6.0]
  def change
    create_table :reminds do |t|
      t.string :name, null: false
      t.string :message_remind
      t.integer :delay_days, default: 0
      t.integer :remind_by, default: 0
    end
  end
end
