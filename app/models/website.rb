class Website < ActiveRecord::Base
  validates :url, :title, :submitter, presence: true
  validates :url, uniqueness: true

  before_validation :ensure_url_format

  belongs_to :submitter, class_name: "User", foreign_key: :submitter_id
  has_many :website_interests
  has_many :interests, through: :website_interests

  has_many :votes



  def count_votes
    count = 0

    self.votes.each do |vote|
      if vote.upvote
        count += 1
      else
        count -= 1
      end
    end
    count
  end

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

  # def get_title
  #   doc = Nokogiri::HTML(open(self.url))
  #   self.title = doc.css('title').first
  # end
end
