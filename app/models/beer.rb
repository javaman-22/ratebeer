class Beer < ApplicationRecord
  include RatingAverage
  validates :name, presence: true

  belongs_to :brewery
  belongs_to :style
  has_many :ratings, dependent: :destroy
  has_many :raters, -> {distinct}, through: :ratings, source: :user

  def self.top(n)
    sorted_by_rating_in_desc_order = Beer.all.sort_by{ |b| -(b.average_rating||0) }
    sorted_by_rating_in_desc_order[0,n]
  end


  def to_s
    "#{name} "
  end

  def average
    return 0 if ratings.empty?
    ratings.map(&:score).sum / ratings.count.to_f
  end
end
