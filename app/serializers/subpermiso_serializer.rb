class SubpermisoSerializer < ActiveModel::Serializer
  attributes :id, :url, :descripcion, :opcion, :icono, :activo
  has_one :permiso
end
