class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_commit :update_with_clearbit_api #after the data is persisted in db (after_save could be to early)
  #the job could also be called from the action update in the profile controller

  private

  def update_with_clearbit_api
    UpdateUserJob.perform_later(self.id)
  end
  
end
