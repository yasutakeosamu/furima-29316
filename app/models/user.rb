class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :familyname, :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :familyname_reader, :firstname_reader, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :birthday, presence: true
end
