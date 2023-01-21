class Cajageneral < ApplicationRecord
  belongs_to :tiporegistro
  belongs_to :concepto
  belongs_to :subconcepto
  belongs_to :tipocomprobante, optional: true
  belongs_to :formapago
  belongs_to :proveedor, optional: true
  belongs_to :created_by, :class_name => 'Usuario'
  belongs_to :updated_by, :class_name => 'Usuario', optional: true
  belongs_to :canceled_by, :class_name => 'Usuario', optional: true
end
