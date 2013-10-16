# coding: utf-8
class UserMailer < ActionMailer::Base
  default from: "\"Oleg // GeekHub\" <olegpasko@gmail.com>"
  
  def new_task(user, post)
    @user = user
    @post = post
    mail to: user.email, subject: "Новое задание на RoR GeekHub"
  end
end