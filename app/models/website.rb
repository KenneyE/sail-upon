class Website < ActiveRecord::Base
  validates :url, :title, :submitter, presence: true
  validates :url, uniqueness: true

  before_validation :ensure_url_format

  belongs_to :submitter, class_name: "User", foreign_key: :submitter_id
  has_many :website_interests
  has_many :interests, through: :website_interests

  private

  def ensure_url_format
    parse_html unless /^http.?:\/\//.match(self.url )
    parse_youtube if self.url.include?("youtube.com")
    parse_vimeo if self.url.include?("vimeo.com")
  end

  def parse_html
    self.url = "http://#{self.url}"
  end

  def parse_youtube
    regex = Regexp.new("(?<=v=).*")
    video_id = self.url.match(regex)
    self.url = "//www.youtube.com/embed/#{video_id}"
  end

  def parse_vimeo
    regex = Regexp.new("(?<=vimeo.com\/).*")
    video_id = self.url.match(regex)
    self.url = "//player.vimeo.com/video/#{video_id}"
  end
end
