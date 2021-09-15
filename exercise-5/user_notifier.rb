# frozen_string_literal: true

class UserNotifier
  def call(user, message, sender_class)
      sender_class.send(user.email, message)
  end
end


notifier = UserNotifier.new
notifier.call(user, "Hello World", EmailSender)
