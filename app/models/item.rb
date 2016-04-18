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

class Item < ActiveRecord::Base

  belongs_to :user
  validates :titulo,
            :imagen,
            :precio,
            :detalle,
            presence: true
  validates :precio,
            numericality: {
              greater_than: 0
            }
end
