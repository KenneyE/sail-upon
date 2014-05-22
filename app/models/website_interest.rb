class WebsiteInterest < ActiveRecord::Base
  belongs_to :website
  belongs_to :interest

  validates :website, :interest, presence: true
  validates_uniqueness_of :website, scope: [:interest]
end
