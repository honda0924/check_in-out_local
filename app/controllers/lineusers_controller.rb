class LineusersController < ApplicationController
  def new
    @lineuser = Lineuser.new()
  end
end
