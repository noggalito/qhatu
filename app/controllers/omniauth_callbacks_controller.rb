class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    user = User.find_or_create_by_omniauth(
      request.env["omniauth.auth"]
    )

    if user.valid?
      sign_in_and_redirect user, event: :authentication
    else
      # some info is missing, probably email
      # TODO redirect to edit_profile
      sign_in_and_redirect user, event: :authentication
    end
  end

  def facebook
    user = User.find_or_create_by_omniauth(
      request.env["omniauth.auth"]
    )

    if user.valid?
      sign_in_and_redirect user, event: :authentication
    else
      # some info is missing, probably email
      # TODO redirect to edit_profile
      sign_in_and_redirect user, event: :authentication
    end
  end
end
