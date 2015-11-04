class User < ActiveRecord::Base
  has_secure_password

  has_many :decks
  has_many :user_guesses
  has_many :cards, through: :user_guesses

  before_validation :ensure_access_token!

  validates_presence_of :username, :full_name
  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /.+@.+\..+/
  validates :access_token, presence: true, uniqueness: true

  def ensure_access_token!
    if self.access_token.blank?
      self.access_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(access_token: token)
      token = SecureRandom.hex
    end
    token
  end

end
