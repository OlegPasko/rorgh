class Post < ActiveRecord::Base
  validates_presence_of :name, :body, :user_id
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  
  scope :tasks, -> { where(task: true) }
end
