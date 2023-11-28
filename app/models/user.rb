# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, exclusion: { in: [''], message: "can't be blank" }
  validates :last_name, exclusion: { in: [''], message: "can't be blank" }
  validates :phone_number, exclusion: { in: [''], message: "can't be blank" }
  validates :year, presence: { message: "can't be blank" }, if: :registration_completed?

  has_many :events, through: :event_logs
  has_many :event_logs, dependent: :destroy
  has_many :announcements, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum access_level: { member: 0, admin: 1 }

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    return nil unless /@tamu.edu\z/.match?(auth.info.email)

    if (user = User.where(email: auth.info.email).first)
      user.update(provider: auth.provider, uid: auth.uid)
      return user
    end

    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.avatar_url = auth.info.image
      user.year ||= Date.today.year
    end
  end

  def can_access_admin_dashboard?
    admin?
  end

  def registration_completed?
    registration_completed
  end

  def name
    "#{first_name} #{last_name}"
  end
end
