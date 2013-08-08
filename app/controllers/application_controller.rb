class ApplicationController < ActionController::Base
	include Mobylette::RespondToMobileRequests
  protect_from_forgery
  before_filter :unread

  def unread
  	if signed_in?
	    @mailbox ||= current_user.mailbox
	    @unread_count ||= @mailbox.inbox(:read => false).count(:id, :distinct => true).to_s
	   end
  end
end
