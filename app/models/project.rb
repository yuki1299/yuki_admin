class Project < ApplicationRecord
  belongs_to :user

  has_many :project_testers, dependent: :destroy
  has_many :testers, through: :project_testers
  has_many :asks
  has_many :tasks
  has_many :credits
  has_many :publics

  validates :user_id, presence: true
  validates :name, presence: true

  FORMAT = AutoHtml::Pipeline.new(
    AutoHtml::HtmlEscape.new,
    AutoHtml::Image.new,
    AutoHtml::YouTube.new(width: '100%', height: 250),
    AutoHtml::Link.new(target: '_blank', rel: 'nofollow'),
    AutoHtml::SimpleFormat.new
  )

  def name=(n)
    super(n)
    self[:name_html] = FORMAT.call(n)
  end
end
