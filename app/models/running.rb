class Running < ApplicationRecord
  attr_accessor :hours, :minutes, :seconds

  belongs_to :activity_list

  has_one_attached :photo
  validates :name, presence: true, length: { maximum: 200 }
  validate :date_in_future

  def date_in_future
    errors.add(:date, "Activity cannot be in the future") if date > Date.today
  end
end
