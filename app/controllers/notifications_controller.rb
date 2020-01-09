class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Notification.where(recipient: current_user)
    @notifications = @messages.unread
  end

  def mark_as_read
    puts params
    @notifications = Notification.where(id: params[:id])
#    @notifications.update_all(:read_at => Time.zone.now)
    @notifications.update(:read_at => Time.zone.now)
    render json: {success: true}
  end
end
