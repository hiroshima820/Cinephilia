class ApplicationController < ActionController::Base
	# def after_sign_in_path_for(resource)
	#     case resource
	#     when Admin
	#       rails_admin_path
	#     when User
	#       root_path
	#     end
	# end

	# ログイン済ユーザーのみにアクセスを許可する
	before_action :authenticate_user!

	# deviseコントローラーにストロングパラメータを追加する 
	before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
  	# サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end
end
