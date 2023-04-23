class Cajamensual < ApplicationRecord
  belongs_to :created_by, :class_name => 'Usuario'
  belongs_to :updated_by, :class_name => 'Usuario', optional: true
end
