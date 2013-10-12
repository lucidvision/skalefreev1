class ApplicationController < ActionController::Base
  require 'rails_autolink'
	include Mobylette::RespondToMobileRequests
  protect_from_forgery
  before_filter :unread
  before_filter :set_request_format

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

  def after_sign_in_path_for(current_user)
    root_path
  end
end
