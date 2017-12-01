class Cat < ActiveRecord::Base

  has_many :comments
  validates :name, :about, :traits, :price, presence: true

  # scope :recent, -> { order(created_at: :desc) }
  # scope :today_total, -> { where("created_at >=?", Time.now.beginning_of_day).length }

end
