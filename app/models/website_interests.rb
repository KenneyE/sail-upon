class WebsiteInterests < ActiveRecord::Base
  belongs_to :website
  belongs_to :interest

  validates :website, :interest, presence: true
  validates_uniqueness_of :website, scope: [:interest]

  def find_website_by_interest
    self.websites.sample
  end
end
