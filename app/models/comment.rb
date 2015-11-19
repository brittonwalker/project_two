class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_length_of :content, :minimum => 1, :too_short => "No comment..."
end
