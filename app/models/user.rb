class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :pseudo, uniqueness: true

         has_many :seeds
         has_many :picks
         has_attachment :photo
         has_many :user_preferences
         has_many :signal_seed



  def has_photo?
    self.photo?
  end


  def has_picked?(seed)
    seed.picks.where(user: self).any?
  end

  def has_signaled?(seed)
      seed.signal_seed.where(user: self).any?
  end

  def user_picked
    picks = Pick.where(user: self)
    seeds = []
    picks.each do |pick|
      seeds << pick.seed
    end
    seeds
  end


end
