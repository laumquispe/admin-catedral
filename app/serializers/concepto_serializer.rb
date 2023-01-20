class ConceptoSerializer < ActiveModel::Serializer
  attributes :id, :descripcion, :activo
  has_one :tiporegistro
end
