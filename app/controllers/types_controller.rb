class TypesController < ApplicationController

  def index
    @types = Type.all
  end

end
