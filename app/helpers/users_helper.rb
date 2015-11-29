# encoding: utf-8

module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def write_user_status(status)
    return "<strong class=admin>Администратор</strong>".html_safe if status == 3
    return "<strong class=manager>Менеджер</strong>".html_safe if status == 2
    return "<strong class=engineer>Инженер</strong>".html_safe if status == 1
    return "<strong class=user>Пользователь</strong>".html_safe if status == 0
  end

  def balance
      hash = RestClient.get("http://sms.ru/my/balance?api_id=9d3359eb-9224-2384-5d06-1118975a2cd2")
      hash[4..-1]
  end

end