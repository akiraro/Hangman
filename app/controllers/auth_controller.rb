class AuthController < Clearance::BaseController
    before_action :authenticate_via_token, only: [:getUser,:destroy ]
    skip_before_action :verify_authenticity_token
    def signup
        @user = User.new(params.permit(:email,:password))

        if @user.save
            render json: {status: 'SUCCESS', message:'Sign up succeed', data:@user}, status: :ok
        else
            render json: {status: 'ERROR', message:'Sign up failed', data:@user}, status: :ok 
        end
    end

    def login
        @user = User.authenticate(params[:email],params[:password])
        sign_in(@user)
        
        if @user != nil
            render json: {status: 'SUCCESS', message:'Login succeed', data:@user}, status: :ok
        else
            render json: {status: 'ERROR', message:'Login failed', data:@user}, status: :ok 
        end
    end

    def destroy

        @token = current_user.reset_remember_token!
        render json: {status: 'SUCCESS', message:'Logged out', token:@token}, status: :ok 
    end

    def getUser
        
        render json: {status: 'SUCCESS', message:'User found', user:current_user}, status: :ok 
    end

end
