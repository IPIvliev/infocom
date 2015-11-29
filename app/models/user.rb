# encoding: utf-8

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :phone, :address, :agent_id, :avatar, :status
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  belongs_to :agent
  has_many :requests
  has_many :posts
  has_many :comments


  mount_uploader :avatar, AvatarUploader

  def admin?
    status == 3
  end

  def manager?
    status == 2
  end

  def engineer?
    status == 1
  end

  def user?
    status == 0
  end

 def manager_engineer?
    status == 1 || status == 2
  end

  def admin_engineer?
    status == 1 || status == 3
  end

  def admin_manager?
    status == 2 || status == 3
  end

  def admin_manager_engineer?
    status == 1 || status == 2 || status == 3
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end