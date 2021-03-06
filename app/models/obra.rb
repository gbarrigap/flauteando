class Obra < ApplicationRecord
  has_many :obras_presentaciones
  has_many :presentaciones, through: :obras_presentaciones
  has_many :conciertos, through: :presentaciones
  has_many :encuentros, through: :presentaciones

  def Obra.for_select
    all.map { |x| [x.titulo, x.id] }
  end
end
