class User < ActiveRecord::Base
  has_many :trip_plans
  acts_as_authentic { |c| c.require_password_confirmation = true }
  validates :password, :password_confirmation, presence: true
end
