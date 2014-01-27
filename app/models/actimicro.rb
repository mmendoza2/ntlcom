class Actimicro < ActiveRecord::Base
  belongs_to :actividad
  belongs_to :micrositio
  belongs_to :evento


end
