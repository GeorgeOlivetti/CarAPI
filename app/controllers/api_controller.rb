class ApiController < ApplicationController
    
    def new
        @api = API.new
    end
end
