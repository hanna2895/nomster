class PlacesController < ApplicationController

    def index
        # @places = Place.all
        @pagy, @places = pagy(Place.all, items: 5)
    end

end
