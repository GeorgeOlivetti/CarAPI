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
        
        @car = Car.new
        @car.vin = Faker::Vehicle.vin
        
        @carMM = Faker::Vehicle.make_and_model
        @mmArray = @carMM.split(/\W+/)
        
        #properly pair up makes with models
        @car.make = @mmArray[0]
        @car.model = @mmArray[1]
        
        #Faker mispells "Camaro"
        if (@car.model == "Camero")
            @car.model = "Camaro"
        end
        
        @car.year = Faker::Vehicle.year
        @car.color = Faker::Vehicle.color
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
    
    def editCar
        
        @car = Car.find(params[:id])
        
        if(params[:vin])
            @car.update_attributes!(:vin => params[:vin])
        end
        if(params[:make])
            @car.update_attributes!(:make =>  params[:make])
        end
        if(params[:model])
            @car.update_attributes!(:model => params[:model])
        end
        if(params[:year])
            @car.update_attributes!(:year => params[:year])
        end
        if(params[:color])
            @car.update_attributes!(:color => params[:color])
        end
        if(params[:ownerFirstName])
            @car.update_attributes!(:ownerFirstName => params[:ownerFirstName])
        end
        if(params[:ownerLastName])
           @car.update_attributes!(:ownerLastName => params[:ownerLastName])
        end
        
        #@car = @car.as_json
        
    respond_to do |format|

     format.html { redirect_to showCar_path(:id => @car.id)}
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