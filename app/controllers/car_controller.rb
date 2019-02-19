class CarController < ApplicationController
    
    @error = ""
    
    before_action :checkToken, only: [:printAll, :showCar, :addRandomCar, :create, :editCar, :delete]
    before_action :createLog, only: [:printAll, :showCar, :addRandomCar, :create, :editCar, :delete] 
    
    def index
    end
    
    def error
        @message = "Token not valid"
        @message = @message.as_json
    end
    
    def checkToken
        #if token is not valid, redirect
        
        @tokens = Token.all
        if (@tokens.where(token: params[:token]).exists? == false)
            redirect_to error_path
        end
    end
    
    def createLog
        @log = Log.new
        @log.action = action_name
        @log.token = params[:token]
        
        #extract all parameters
        
        @log.parameters = { "vin" => params[:vin],
        "make" => params[:make],
        "model" => params[:model],
        "year" => params[:year],
        "color" => params[:color],
        "ownerFirstName" => params[:ownerFirstName],
        "ownerLastName" => params[:ownerLastName]
        }
        
        @log.save
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
        format.html { redirect_to showCar_path(:id => @car.id, :token => params[:token])}
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
    
    def helper
        
        @actions = ["printAll", "showCar", "createCar", "addRandomCar", "editCar", "deleteCar"]
        
        if(params[:commit] == "Make Query")
        respond_to do |format|
            format.html { redirect_to query_path}
            format.json { head :no_content }
        end
        end
    end
    
    def query
        
         @actions = ["printAll", "showCar", "createCar", "addRandomCar", "editCar", "deleteCar"]
        
        @query = "/"
        
        if(params[:action])
           @action = params[:action]
           @query << @action
        end
        if(params[:id])
           @id = "id=" << params[:id] << "?"
           @query << @id
        end
        if(params[:vin])
            @vin = "vin=" << params[:vin] << "?"
            @query << @vin
        end
        if(params[:make])
           @make = "make=" << params[:make] << "?"
           @query << @make
        end
        if(params[:model])
           @model = "model=" << params[:model] << "?"
           @query << @model
        end
        if(params[:year])
           @year = "year=" << params[:year] << "?"
           @query << @year
        end
        if(params[:color])
            @color = "color=" << params[:color] << "?"
            @query << @color
        end
        if(params[:ownerFirstName])
            @ownerFirstName = "ownerFirstName=" << params[:ownerFirstName] << "?"
            @query << @ownerFirstName
        end
        if(params[:ownerLastName])
           @ownerLastName = "ownerLastName=" << params[:ownerLastName] << "?"
           @query << @ownerLastName
           
        end
        
        
    end
end