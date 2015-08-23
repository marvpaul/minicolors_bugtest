class EinText < ActiveRecord::Base
  attr_accessible :farbe, :text
  def self.alle_aktiven
  	EinText.where(:aktiviert => true)
  end
end
