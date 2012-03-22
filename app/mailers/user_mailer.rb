class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def share_notification(user, mixtape)
    @mixtape = mixtape
    @user = user
    mail :to => user.email, :subject => "#{mixtape.name} mixtape has been shared with you!"
  end
  
end
