class UserInterest < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest

  validates :user, :interest, presence: true
  validates_uniqueness_of :user, scope: [:interest]
end
