class Comment < ActiveRecord::Base
  has_ancestry
  validates_presence_of :user_id, :post_id, :body
  default_scope order('created_at ASC')
  
  belongs_to :user
  belongs_to :post
end
