class MinicolorsController < ApplicationController
  def test
  	@ein_text = EinText.find(1)
  end
end
