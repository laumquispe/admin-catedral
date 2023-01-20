class PermisoSerializer < ActiveModel::Serializer
  attributes :id, :url, :descripcion, :opcion, :icono, :activo
  has_many:subpermiso
end
