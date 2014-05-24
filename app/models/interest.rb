class Interest < ActiveRecord::Base
  before_validation :assign_color
  validates :name, presence: true, uniqueness: true
  validates :color, presence: true

  has_many :user_interests
  has_many :users, through: :user_interests, source: :user

  has_many :website_interests
  has_many :websites, through: :website_interests, source: :website

  def find_website_by_interest
    self.websites.sample
  end

  private
  def assign_color
    colors = [
      "dark-blue"    ,
      "light-blue"   ,
      "orange"       ,
      "yellow"       ,
      "purple"       ,
      "dark-red"     ,
      "light-green"  ,
      "dark-green"   ,
      "pink"        ]

      self.color = colors.sample
  end
end
