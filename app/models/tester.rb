class Tester < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, through: :project_testers, dependent: :destroy

  extend Enumerize

  enumerize :gender, in: [:masculino, :feminino, :outro]
  enumerize :kind_of_disability, in: [:cegueira, :baixa_visão, :surdez, :deficiência_auditiva, :deficiência_Física_Leve, :deficiência_Física_Severa, :outras]
end
