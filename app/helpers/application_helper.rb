module ApplicationHelper
  
  def gravatar_url(user, size = 100)
    gravatar_id = Digest::MD5::hexdigest(user.email)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=identicon"
  end
  
end
