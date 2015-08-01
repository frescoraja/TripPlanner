class TripPlan < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { minimum: 1 }
  validate :default_pic

  private
  def default_pic
    self.picture ||= "default#{rand(1..6)}.jpg"
  end
end
