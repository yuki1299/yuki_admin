class Ask < ApplicationRecord
  belongs_to :project
  has_many :answers, as: :project_answer
  extend Enumerize

  enumerize :ask_type, in: [:pergunta_aberta, :pergunta_fechada, :escala_de_zero_à_seis]
end
