class LogController < ApplicationController
    
    def show
        @logs = Log.all
    end
    
end
