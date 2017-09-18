class Project < ApplicationRecord
  belongs_to :user

  has_many :project_testers, dependent: :destroy
  has_many :testers, through: :project_testers
  has_many :asks, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :publics, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true

  FORMAT = AutoHtml::Pipeline.new(
    AutoHtml::HtmlEscape.new,
    AutoHtml::Image.new,
    AutoHtml::YouTube.new(width: '100%', height: 250),
    AutoHtml::Link.new(target: '_blank', rel: 'nofollow'),
    AutoHtml::SimpleFormat.new
  )

  def url=(n)
    super(n)
    self[:url_html] = FORMAT.call(n)
  end
end
