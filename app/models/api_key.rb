class ApiKey < ActiveRecord::Base
  belongs_to :user

  scope :active, -> { where ["expires_at > (?)", Time.now] }

  before_create { generate_nonce }

private

  def generate_nonce
    begin
      self.nonce = SecureRandom.uuid
    end while self.class.exists?(nonce: nonce)
  end
end
