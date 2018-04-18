class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :title, presence: true
  # validates :url, url: { allow_blank: true }

  def self.search(search)
    t = Post.where("tags like ? or title like ?", "%#{search}%", "%#{search}%")
  end

  def score
    self.votes.sum(:value)
  end

end
