class User < ApplicationRecord
  has_many :wikis
  has_many :collaborators

  before_save { self.email = email.downcase }
  after_initialize { self.role ||= :standard }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :name, length: { minimum: 3 }, presence: true

  enum role: [:standard, :premium, :admin]

  def update_private
    self.wikis.where(private: 't').update_all(private: 'f')
  end

end
