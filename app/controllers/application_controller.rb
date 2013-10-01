class ApplicationController < ActionController::Base
	include Mobylette::RespondToMobileRequests
  protect_from_forgery
  before_filter :unread
  before_filter :set_request_format, :set_format_fallbacks

  def unread
  	if signed_in?
	    @mailbox ||= current_user.mailbox
	    @unread_count ||= @mailbox.inbox(:read => false).count(:id, :distinct => true).to_s
	   end
  end

  def set_request_format
	  if is_mobile_request? && request.filtered_parameters["format"].to_s == "text/html"
	      request.filtered_parameters["format"] = :mobile
	  elsif is_mobile_request? && request.filtered_parameters["format"].to_s == "text/javascript"
	      request.filtered_parameters["format"] = :mobilejs
	  end
	end

	def set_format_fallbacks
	  if request.filtered_parameters["format"] == :mobile
	    request.filtered_parameters["format"] = :html
	  elsif request.filtered_parameters["format"] == :mobilejs
	    request.filtered_parameters["format"] = :js
	  end
	end
  
end
