class TipousuarioPermisoSerializer < ActiveModel::Serializer
  attributes :id, :permisourl, :permisodescripcion, :permisoopcion, :permisoid, :permisoicono, :subpermisos
  has_one :permiso

  def permisoid
    object.permiso.id
  end

  def permisourl
    object.permiso.url
  end
  
  def permisodescripcion
    object.permiso.descripcion
  end

  def permisoopcion
    object.permiso.opcion
  end  

  def permisoicono
    object.permiso.icono
  end  

  def subpermisos
      TipousuarioSubpermiso.joins(:subpermiso).where(subpermisos: {permiso_id: object.permiso.id}).where(tipousuario_id: instance_options[:tipousuarioid]).order(:descripcion).map do |subpermiso|
      ::TipousuarioSubpermisoSerializer.new(subpermiso).attributes
    end 
  end  
end
