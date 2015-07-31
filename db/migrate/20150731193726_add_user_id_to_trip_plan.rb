class AddUserIdToTripPlan < ActiveRecord::Migration
  def change
    add_reference :trip_plans, :user
    add_foreign_key :trip_plans, :users
  end
end
