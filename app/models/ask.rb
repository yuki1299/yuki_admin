class Ask < ApplicationRecord
  belongs_to :project
  extend Enumerize

  enumerize :ask_type, in: [:opened_ask, :closed_ask, :scale_zero_to_five]
end
