class Public < ApplicationRecord
  extend Enumerize
  belongs_to :project

  enumerize :gender, in: [:masculino, :feminino, :ambos, :outros]
  enumerize :schooling, in: [:fundamental, :medium, :superior, :post_graduated, :doctorated, :master]
  enumerize :locale, in: [:north, :northeast, :midwest, :southeast, :south]
  serialize :kind_of_disability, Array
  enumerize :kind_of_disability, in: [:cegueira, :baixa_visão, :surdez, :deficiência_auditiva, :deficiência_Física_Leve, :deficiência_Física_Severa, :outras], multiple: true
end
