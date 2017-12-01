class Comment < ActiveRecord::Base
  belongs_to :cat
  validates :user_id, :cat_id, :content, presence: true

end
