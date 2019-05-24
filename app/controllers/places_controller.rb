class PlacesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @pagy, @places = pagy(Place.all, items: 5)
    end

    def new
        @place = Place.new
    end

    def create
        current_user.places.create(place_params)
        redirect_to root_path
    end

    private

    def place_params
        params.require(:place).permit(:name, :description, :address)
    end

end
