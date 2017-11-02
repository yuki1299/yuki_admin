class Tester < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, through: :project_testers, dependent: :destroy

  extend Enumerize

  enumerize :gender, in: [:male, :female, :other]
end
