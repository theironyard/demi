class User < ActiveRecord::Base
  ROLES = %w( admin peasant )

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, inclusion: { in: ROLES }

  has_many :api_keys do
    def generate!
      create! expires_at: Time.now + 2.weeks
    end
  end

  def self.find_by_api_key key
    key = ApiKey.active.where(nonce: key).first!
    key.user
  rescue
    raise CanCan::AccessDenied
  end

  def admin?
    role.to_s == 'admin'
  end
end
