module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session

    include ApiResponders
    include ApiAuthenticate
  end
end
