class ZebraService < ApplicationService
  BASE_URL = 'https://www.zebraurbana.com.br'.freeze
  PROMOTIONS_URL = "#{BASE_URL}/palmas".freeze

  def initialize(model)
    @promotions = nil
    @model = model
  end

  def fetch_promotion_links
    html = Nokogiri::HTML(open(PROMOTIONS_URL))
    html.css('a.product')
  end

  def fetch_promotion(link)
    promotion = Nokogiri.HTML5(open(link))
    promotion.css('.product').first
  end

  def build_promotion(link, promotion)
    basic_promotion_data(link, promotion).merge(origin: 'zebraurbana', promoter: 'zebraurbana')
  end

  def build_and_create_promotion(link, promotion)
    create_promotion(build_promotion(link, promotion))
  end

  private

  def convert_link(link_node)
    { href: "#{BASE_URL}#{link_node['href']}", text: link_node.text }
  end

  def extract_title(promotion)
    promotion.css('header > h2').text.squeeze(' ').delete("\n")
  end

  def extract_image(promotion)
    partial_url = promotion.css('.carousel-inner > .item > img').first['src']
    "https:#{partial_url}"
  end

  def extract_relevance(promotion)
    promotion.css('p > span.text-danger').text&.to_i
  end

  def extract_value(promotion)
    promotion.css('.price > .new').text[/\d+,\d+/]
  end

  def format_promotion_content(promotion)
    promotion = promotion.css('.details').text
    promotion.delete!("\t")
    promotion.squeeze!(' ')
    promotion.squeeze!("\n")
    promotion
  end

  def extract_identifier(promotion_link)
    promotion_link[/\d+$/]
  end
end
