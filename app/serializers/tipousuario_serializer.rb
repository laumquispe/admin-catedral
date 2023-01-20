class TipousuarioSerializer < ActiveModel::Serializer
  attributes :id, :descripcion, :activo
  has_many:tipousuario_permiso
end
