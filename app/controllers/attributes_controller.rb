class AttributesController < ApplicationController
  def index
    @arrAttr = Attribute.count
  end

end
