module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def avatar_for(user)

    image_tag(@user.avatar)
  end
end
