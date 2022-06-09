require 'open-uri'

class ProfilesController < ApplicationController
  def show
    avatar = URI.open('https://upload.wikimedia.org/wikipedia/commons/1/1e/Default-avatar.jpg?20160314221008')
    @default_image = current_user.photo.attach(io: avatar, filename: "1.jpeg", content_type: 'image/jpeg') unless current_user.photo.key
  end
end
