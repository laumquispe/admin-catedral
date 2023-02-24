class TipousuarioSubpermisoSerializer < ActiveModel::Serializer
  attributes :id, :subpermisoid, :subpermisourl, :subpermisodescripcion, :subpermisoopcion, :subpermisoicono
  has_one :tipousuario
  has_one :subpermiso

  def subpermisoid
    object.subpermiso.id
  end

  def subpermisourl
    object.subpermiso.url
  end
  
  def subpermisodescripcion
    object.subpermiso.descripcion
  end

  def subpermisoopcion
    object.subpermiso.opcion
  end  


  def subpermisoicono
    object.subpermiso.icono
  end   
end
