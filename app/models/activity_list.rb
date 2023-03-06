class ActivityList < ApplicationRecord
  belongs_to :user
  has_many :runnings
  has_many :winter_sports
  has_many :cyclings
  has_many :swimmings
  has_many :walkings
end
