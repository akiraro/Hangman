class AuthController < Clearance::BaseController
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
        sign_out
    end

end
