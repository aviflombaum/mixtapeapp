class UserMixtapeObserver < ActiveRecord::Observer
  def after_create(record)
    UserMailer.shared_mixtape(record.user, record.mixtape).deliver
  end
end
