class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    enum access_level: { user: 0, admin: 1 }
    devise :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]


    def self.from_google(email:, full_name:, uid:, avatar_url:)
      return nil unless email =~ /@tamu.edu\z/
      user = User.find_or_initialize_by(email: email)
      if user.new_record?
        user.uid = uid
        user.full_name = full_name
        user.avatar_url = avatar_url
        user.save!
      end
      user
    end

    def password_required?
      super && provider.blank?
    end

    
    

    def completed_registration!
      update(registration_completed: true)
    end
end
