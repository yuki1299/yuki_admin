class Tester < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :project_testers, dependent: :destroy
  has_many :projects, through: :project_testers

  extend Enumerize

  enumerize :gender, in: [:male, :female, :other]
end
