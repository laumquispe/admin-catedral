class CajamensualSerializer < ActiveModel::Serializer
  attributes :id, :periodo, :saldoinicial, :ingreso, :egreso, :saldocierre
end
