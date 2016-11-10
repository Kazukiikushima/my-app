class Dwelling < ActiveRecord::Base
  belongs_to :estimate
  belongs_to :person
end
