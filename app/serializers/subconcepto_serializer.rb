class SubconceptoSerializer < ActiveModel::Serializer
  attributes :id, :descripcion, :activo
  #has_one :concepto
end
