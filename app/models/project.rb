class Project < ApplicationRecord
  belongs_to :user

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
