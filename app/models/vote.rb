class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :website

  validates :user, :website, presence: true
  validates_uniqueness_of :user, scope: [:website]
end
