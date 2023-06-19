class CajamensualSerializer < ActiveModel::Serializer
  attributes :id, :periodo, :saldoinicial, :ingreso, :egreso, :saldocierre

  attribute :saldoinicial do 
    object.saldoinicial.to_f
  end 

  attribute :ingreso do 
    object.ingreso.to_f
  end 

  attribute :egreso do 
    object.egreso.to_f
  end 

  attribute :saldocierre do 
    object.saldocierre.to_f
  end 
end
