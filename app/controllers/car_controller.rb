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
    
    def showCar
        @car = Car.where(id: params[:id])
        @car = @car.as_json
    end
    
    def addRandomCar
        @random_car = Vinbot::Vehicle.new
        @car = Car.new
        @car.vin = @random_car.vin
        @car.make = @random_car.make
        @car.model = @random_car.model
        @car.year = @random_car.year
        @car.color = @random_car.exterior_colors[0]
        @car.ownerFirstName = Faker::Name.first_name
        @car.ownerLastName = Faker::Name.last_name
        @car.save
       # @car_format = @car.as_json

    respond_to do |format|
        format.html { redirect_to showCar_path(:id => @car.id)}
        format.json { head :no_content }
    end
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
   #@car = @car.as_json

   respond_to do |format|
        format.html { redirect_to showCar_path(:id => @car.id)}
        format.json { head :no_content }
    end

        
    end
    
    def setName
        @car = Car.find(params[:id])
        @car.update_attributes!(:ownerFirstName => params[:ownerFirstName])
        @car.update_attributes!(:ownerLastName => params[:ownerLastName])
        
        @car = @car.as_json
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