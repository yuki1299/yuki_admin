class Public < ApplicationRecord
  belongs_to :project
  extend Enumerize

  enumerize :gender, in: [:female, :male]
  enumerize :schooling, in: [:fundamental, :medium, :superior, :post_graduated, :doctorated, :master]
  enumerize :locale, in: [:north, :northeast, :midwest, :southeast, :south]
end
