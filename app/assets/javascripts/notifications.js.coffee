class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")

    if @notifications.length > 0

      setInterval (=>
        @getNewNotifications()
      ), 5000

    @getNewNotifications()

  getNewNotifications: ->
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  handleClick: (id) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      data: {id: id}
      dataType: "JSON"
      method: "POST"
      success: @getNewNotifications()
    )

  handleSuccess: (data) =>
    console.log(data)
    items = [];
    $("[data-behavior='notification-items']").html('');
    $.each data, (index, notification) =>
      element = document.createElement('a');
      element.classList.add('dropdown-item');
      element.setAttribute('data-behavior', 'notifications-link');
      element.href = "#{notification.url}";
      element.textContent = "#{notification.actor} #{notification.action} #{notification.notifiable.type}";
      element.addEventListener('click', (e) => @handleClick("#{notification.id}"));
      items.push(element)


    $("[data-behavior='unread-count']").text(items.length)
    $("[data-behavior='notification-items']").append(items);

jQuery ->
  new Notifications
