class PasswordsController < Devise::PasswordsController
	before_filter :after_sign_in_path_for

	def after_sign_in_path_for(current_user)
    root_path
  end
end