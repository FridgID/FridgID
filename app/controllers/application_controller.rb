class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :self_authenticate_user

  def self_authenticate_user
    @user = User.find_by_email('test@test.com')
    sign_in(@user)
  end

  # def self_authenticate_user
  #   if persistence_required?
  #     authenticate_user!
  #   elsif user == User.find_by_cookie_secret(get_cookie_secret)
  #     sign_in(user)
  #   else
  #     cookie_secret = generate_cookie_secret
  #     user = User.create!(cookie_secret: cookie_secret)
  #     set_cookie_secret(cookie_secret)
  #     sign_in(user)
  #   end
  # end
end
