class ShareObserver < ActiveRecord::Observer
  observe UserMixtape
  
  def after_create(user_mixtape)
    UserMailer.share_notification(user_mixtape.user, user_mixtape.mixtape).deliver
  end
  
end
