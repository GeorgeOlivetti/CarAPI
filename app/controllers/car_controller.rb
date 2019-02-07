class CarController < ApplicationController
    
    def index
    end
    
    def printAll
        
        #prints all vehicles, parameters can be passed in to narrow down the search.
        
        # ex. /printAll?make=Toyota
        # the above query will only list "Toyota" vehicles
        
        # ex. /printAll?make=Toyota&color=White
        # the above query will only list vehicles that are BOTH "Toyota" and "White"
        
      @car = Car.all
        
       if(params[:vin])
            @car = @car.where(vin: params[:vin])
       end
       if(params[:make])
            @car = @car.where(make: params[:make])
       end
       if(params[:model])
           @car = @car.where(model: params[:model])
       end
       if(params[:year])
            @car = @car.where(year: params[:year])
       end
       if(params[:color])
            @car = @car.where(color: params[:color])
       end
       if(params[:ownerFirstName])
            @car = @car.where(ownerFirstName: params[:ownerFirstName])
       end
       if(params[:ownerLastName])
           @car = @car.where(ownerLastName: params[:ownerLastName])
       end
       
    @car = @car.as_json

    end
    
    def create
        
        # createCar?vin=1GNDT13Z7M2303951&make=Ford&model=Explorer&year=1997&color=Green&ownerFirstName=Jeff&ownerLastName=Adams
        
    @car = Car.new
    @car.vin = params[:vin]
    @car.make = params[:make]
    @car.model = params[:model]
    @car.year = params[:year]
    @car.color = params[:color]
    @car.ownerFirstName = params[:ownerFirstName]
    @car.ownerLastName = params[:ownerLastName]
    @car.save
   # @car = @car.as_json

    respond_to do |format|
        format.html { redirect_to printAll_path}
        format.json { head :no_content }
    end

        
    end
    
    def delete
        
    @car = Car.find(params[:id])
    @car.destroy
        
        
    respond_to do |format|

     format.html { redirect_to printAll_path}
     format.json { head :no_content }

    end
    
    end
end