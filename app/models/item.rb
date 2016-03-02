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
#

class Item < ActiveRecord::Base
  validates :titulo,
            :imagen,
            :precio,
            :detalle,
            presence: true
end
