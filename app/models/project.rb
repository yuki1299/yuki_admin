class Project < ApplicationRecord
  include AASM
  extend Enumerize

  enumerize :test_platform, in: [:desktop, :mobile, :tablet, :outro]

  belongs_to :user
  has_many :testers, through: :project_testers, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :asks, dependent: :destroy
  has_many :publics, dependent: :destroy
  has_many :credits, dependent: :destroy

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

  aasm column: :status do
    state :draft    , :initial => true
    state :sent
    state :in_progress
    state :finished

    event :to_sent do
      transitions :from => :draft, :to => :sent
    end

    event :progress do
      transitions :from => :sent, :to => :in_progress
    end

    event :finish do
      transitions :from => :in_progress, :to => :finished
    end
  end
end
