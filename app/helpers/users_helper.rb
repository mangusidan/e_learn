module UsersHelper
  include ActionView::RecordIdentifier
  def gravatar_for(user, options = { size: 80 })
    size         = options[:size]
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end

  def following?(user)
    current_user&.followees&.include?(user)
  end

  def dom_id_for_follower(follower)
    dom_id(follower)
  end
end
