require 'securerandom'

class Post < ApplicationRecord
  belongs_to :blog

#  belongs_to :tag
  has_many :tags

  MARKDOWN_OPTIONS = {
    no_intra_emphasis: true,
    tables: true,
    fenced_code_blocks: true,
    autolink: true,
    disable_indented_code_blocks: true,
    strikethrough: true,
    lax_spacing: true,
    space_after_headers: true,
    superscript: true,
    quote: true,
    footnotes: true
  }

  RENDER_OPTIONS = {
    filter_html: false,
    no_images: false,
    no_links: false,
    no_styles: true,
    escape_html: false,
    safe_links_only: true,
    with_toc_data: true,
    hard_wrap: false,
    xhtml: false,
    prettify: false,
    link_attributes: { target: '_blank', rel: 'noopener' }
  }

  def safe_content
    # TODO: Add code in here to filter or encode anything that is not allowed.
    content
  end

  def html_content
    renderer = Redcarpet::Render::HTML.new(RENDER_OPTIONS)
    markdown = Redcarpet::Markdown.new(renderer, MARKDOWN_OPTIONS)
    markdown.render(content)
  end

  def self.uuid
    SecureRandom.uuid.gsub(/-/, '')
  end
end
