# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, presence: true, if: :registration_completed?


  has_many :events, through: :event_logs
  has_many :event_logs, dependent: :destroy

  enum access_level: { member: 0, admin: 1, officer: 2 }

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    return nil unless /@tamu.edu\z/.match?(auth.info.email)

    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.avatar_url = auth.info.image
    end
  end

  def can_access_admin_dashboard?
    admin?
  end

  def can_access_officer_dashboard?
    admin? || officer?
  end

  def registration_completed?
    registration_completed
  end
  
end
