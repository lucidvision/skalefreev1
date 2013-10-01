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
	  if is_mobile_request?
	    if request.format == :js
	      request.format = :mobilejs
	    else
	      request.format = :mobile
    	end
    end
  end

	def set_format_fallbacks
	  if request.format == :mobile
	    self.formats = [:mobile, :html]
	  elsif request.format == :mobilejs
	    self.formats = [:mobilejs, :js]
	  end
	end
  
end
