json.array! @notifications do |notification|
#  json.recipient notification.recipient
  json.id notification.id
  json.actor notification.actor.username
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  if notification.action === "posted"
    json.url post_path(notification.notifiable.post_id)
  elsif notification.action === "liked"
    json.url post_path(notification.notifiable)
  else notification.action === "favored"
    json.url pet_path(notification.notifiable)
  end

end