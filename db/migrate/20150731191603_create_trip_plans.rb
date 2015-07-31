class CreateTripPlans < ActiveRecord::Migration
  def change
    create_table :trip_plans do |t|
      t.string :title, null: false
      t.string :picture, null: false

      t.timestamps null: false
    end
    add_index :trip_plans, :title
    add_index :trip_plans, :created_at
  end
end
