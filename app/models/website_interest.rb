class WebsiteInterest < ActiveRecord::Base
  belongs_to :website, inverse_of: :website_interests
  belongs_to :interest, inverse_of: :website_interests

  validates :website, :interest, presence: true
  validates_uniqueness_of :website, scope: [:interest]
end
