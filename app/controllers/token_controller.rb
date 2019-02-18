class TokenController < ApplicationController
    
    require 'securerandom'
    
    def index
    end
    
    def new
        
        @token = Token.new
        
    end
    
    def show
        
        @token = Token.new
        name = params[:token]
        @token.firstName = name[:firstName]
        @token.lastName = name[:lastName]
        
        #check if token already exists
        
        @tokens = Token.all
        @token.token = SecureRandom.hex(32)
        
        while (@tokens.where(token: @token.token) == nil)
            @token.token = SecureRandom.hex(32)
        end
        
        @token.save
        
    end
    
    def list
        @token = Token.all
        @token = @token.as_json
    end
    
    def token_params
      params.require(:token).permit(:firstName, :lastName, :token)
    end
    
end
