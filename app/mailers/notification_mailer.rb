class NotificationMailer < ApplicationMailer
  default from: "no-reply@meadsterapp.com"

  def comment_added
    mail(to: "dkelsey@bellsouth.net", subject: "A comment has been added to your place")
  end

end
