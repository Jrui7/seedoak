class Seed < ApplicationRecord
  after_create :pick_reminder
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one :campaign, dependent: :destroy
  belongs_to :category
  belongs_to :user
  has_many :picks, dependent: :destroy
  has_many :signal_seed, dependent: :destroy


  self.per_page = 10




  validates :title,
    presence: {
    message: "Nom du produit requis"
    }
  validates :title, uniqueness: {
    message: "Produit déjà posté"
    }

  validates :title, length: { minimum: 5 }

  validates :description,
    presence: {
    message: "Description personnelle obligatoire"
    }

  validates :description,  length: { minimum: 5,
    too_short: "%{count} carractères au minimum" }

  validates :category_id, presence: {
    message: "Attribuez une catégorie au produit"
    }

  validates :photos, presence: {
    message: "Ajoutez au moins une photo"
    }

  validates :sale_point_url,
    presence: {
    message: "Premettre aux utilisateurs d'obtenir plus d'infos sur le produit"
    }

  validates :sale_point_url, url: true

  validates :url, url: true

  # validates :size_guide, presence: true, if: :mode?




  has_attachments :photos, maximum: 5

  scope :category, -> (category) { where category: category}
  scope :popular, -> { order(popularity: :desc) }
  scope :newest, -> { order(expiration: :desc)}
  scope :ongoing, -> { where('expiration > ?', DateTime.now)}
  scope :expired, -> { where('expiration < ?', DateTime.now)}
  scope :last_day, -> { where('expiration < ?', (DateTime.now + 1.days))}

  def set_expiration
    self.expiration = DateTime.now + 7.days
  end


  def increment_views
    self.view_counter += 1
    save!
  end


  def increment_popularity
    self.popularity = (self.view_counter + self.picks.count * 5)
    save!
  end

  def extract_seed_photos
    collection = []
    self.photos.each do |photo|
      collection << photo
    end
    return collection
  end

  def ongoing?
    self.expiration > DateTime.now
  end

  def self.seed_selection
    ongoing.where(status:"published", admin_review: ["Valide", "not-reviewed"])
  end

  def self.seed_sample_expired
    where(status:"published", admin_review: ["Valide", "not-reviewed"])
  end

  def cancel_campaign
    self.picks.each do |pick|
      pick.state = "cancelled"
      pick.save
    end
  end


  def pick_reminder
    SendPickReminderJob.set(wait: 6.days).perform_later(self.id)
  end



end
