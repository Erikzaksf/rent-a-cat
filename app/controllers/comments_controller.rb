class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :cat

  validates :user, :cat_id, :content, presence: true

  # scope :recent, -> { order(created_at: :desc) }
  # scope :today_total, -> { where("created_at >=?", Time.now.beginning_of_day).length }

end
