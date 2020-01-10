class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).unread
#    render :json => @notifications
  end

  def mark_as_read
    puts params
    @notifications = Notification.where(id: params[:id])
#    @notifications.update_all(:read_at => Time.zone.now)
    @notifications.update(:read_at => Time.zone.now)
    render json: {success: true}
  end
end
