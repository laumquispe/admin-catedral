class TipousuarioSubpermisoSerializer < ActiveModel::Serializer
  attributes :id
  has_one :tipousuario
  has_one :subpermiso
end
