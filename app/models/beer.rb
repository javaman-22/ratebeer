class Beer < ApplicationRecord
  include RatingAverage
  validates :name, presence: true

  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, -> {distinct}, through: :ratings, source: :user

  def to_s
  end

  def average
    return 0 if ratings.empty?
    ratings.map(&:score).sum / ratings.count.to_f
  end
end
