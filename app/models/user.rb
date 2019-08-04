class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :twitter]
  # omniauthのコールバック時に呼ばれるメソッド
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        image:    auth.info.image,
        name:     auth.info.username,
        nickname: auth.info.nickname
      )
    end
    user
  end

  has_many :takes 
  has_many :drinks, through: :takes, source: :drink
  
  def take(drink)
      self.takes.create(drink_id: drink.id)
  end

  def untake(drink)
    take = self.takes.find_by(drink_id: drink.id)
    take.destroy if take
  end
  
  def drink?(drink)
    self.drinks.include?(drink)
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end