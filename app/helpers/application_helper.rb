module ApplicationHelper
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
      end
    }

    messages
  end
def gravatar_for(user, size = 30, title = user.name)
  image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
end
end

