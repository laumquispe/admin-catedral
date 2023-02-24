class ConceptoSerializer < ActiveModel::Serializer
  attributes :id, :descripcion, :activo, :tiporegistro_id
  has_one :tiporegistro
end
