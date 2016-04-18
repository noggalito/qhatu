# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  titulo     :string
#  imagen     :string
#  precio     :float
#  detalle    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryGirl.define do
  factory :item do
    sequence(:titulo) { |n| "item #{n}" }
    precio { (rand*10).round(2) }
    detalle { "description for #{titulo}" }
    imagen "http://mcgindex.com/static/img/product-placeholder.png"
  end
end
