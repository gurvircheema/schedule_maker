class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :week
      t.integer :weekday
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
