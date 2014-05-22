class Website < ActiveRecord::Base
  validates :url, :title, :submitter, presence: true
  validates :url, uniqueness: true

  belongs_to :submitter, class_name: "User", foreign_key: :submitter_id
  has_many :website_interests
  has_many :interests, through: :website_interests
end
