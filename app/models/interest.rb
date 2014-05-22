class Interest < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :user_interests
  has_many :users, through: :user_interests, source: :user

  has_many :website_interests
  has_many :websites, through: :website_interests, source: :website

  def find_website_by_interest
    self.websites.sample
  end
end
