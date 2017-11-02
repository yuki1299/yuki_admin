class Public < ApplicationRecord
  extend Enumerize
  belongs_to :project

  enumerize :gender, in: [:female, :male]
  enumerize :schooling, in: [:fundamental, :medium, :superior, :post_graduated, :doctorated, :master]
  enumerize :locale, in: [:north, :northeast, :midwest, :southeast, :south]
end
