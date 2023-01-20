class CtacteproveedorSerializer < ActiveModel::Serializer
  attributes :id, :fecha, :numerofactura, :ingreso, :egreso, :activo
  has_one :proveedor
end
