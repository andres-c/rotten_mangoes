class Movie < ActiveRecord::Base
  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :image,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  mount_uploader :image, ImageUploader

  scope :by_duration, lambda {|start, finish| where("runtime_in_minutes >= ? AND runtime_in_minutes <= ?", start, finish)}

  scope :by_search, lambda {|search| where("title LIKE ? or director LIKE ?", "%#{search}%" , "%#{search}%")}

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end


end
