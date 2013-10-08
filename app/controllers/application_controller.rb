class ApplicationController < ActionController::Base
	include Mobylette::RespondToMobileRequests
  protect_from_forgery
  before_filter :unread
  before_filter :set_request_format
  before_filter :after_token_authentication

  def unread
  	if signed_in?
	    @mailbox ||= current_user.mailbox
	    @unread_count ||= @mailbox.inbox(:read => false).count(:id, :distinct => true).to_s
	   end
  end

  def set_request_format
  	session[:mobile_param] = params[:mobile] if params[:mobile]
  	request.format = :mobile if is_mobile_request? && !request.xhr?
	  if is_mobile_request?
	    if request.format == :js
	      request.format = :mobilejs
	    else
	      request.format = :mobile
    	end
    end
  end

  def after_token_authentication
    if params[:authentication_key].present?
      @user = User.find_by_authentication_token(params[:authentication_key])
      the user with the authentication_key with which devise has authenticated the user
      sign_in @user if @user 
      redirect_to root_path 
    end
  end
end
