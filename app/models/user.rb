# coding: utf-8
class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email, :name, message: "не должно быть пустым"
  validates :email, :format => {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Wrong Email format" }, :uniqueness => true
  validates_length_of :password, :within => 5..99, 
    too_long: "слишком длинный.", 
    too_short: "должен состоять из 5 символов и более."
    
  has_many :posts
  has_many :comments
end