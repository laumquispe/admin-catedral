class RegistrosagrupadosSerializer < ActiveModel::Serializer
  attributes :tiporegistro_id,:concepto_id,:subconcepto_id,:concepto,:subconcepto,:suma, :periodo

  attribute :suma do 
    object.suma.to_f
  end 

  def periodo
    if !instance_options[:periodo].nil?
      return   instance_options[:periodo]
    end
    
  end


  def subconcepto 
      s = Subconcepto.where(id:object.subconcepto_id).map do |s|
           ::SubconceptoSerializer.new(s).attributes          
           end 
    return s  
  end 

  def concepto 
      con = Concepto.where(id:object.concepto_id).map do |con|
           ::ConceptoSerializer.new(con).attributes          
           end 
    return con  
  end 

end
