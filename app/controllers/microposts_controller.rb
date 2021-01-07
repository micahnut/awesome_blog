class MicropostsController < ApplicationController
    # in home page, only logged in users can see the microposts
    before_action :only_loggedin_users, only: [:create, :destroy]

    def create
        #seeds.rb -> .create (User.create)
        #user (is the parent) ->user.save
        # current_user.microposts (user can create MANY microposts) -> .build (because there is relationship)
        @microposts = current_user.microposts.build(micropost_params)
        if @micropost.save
            redirect_to root_url
        else
            # Collection: -> in _feed.html.erb will get all micropost and show it here in the []
            # 1. create micropost
            # 2. save in database
            # 3. displays in user show page
            # 4. display in home page because of @feed items = []
            @feed_items = []
            redirect_to root_url
        end
    end

    def destroy
        Micropost.find(params[:id]).destroy 
        redirect_to root_url
    end

    private
    def microposts_params
        params.require(:micrpost).permit(:content)
    end
end
