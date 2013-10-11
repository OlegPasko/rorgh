class Answer < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates_presence_of :post_id, :user_id
  validates_uniqueness_of :user_id, :scope => :post_id
  
  STATUSES = %w(new for_revision done)

end
