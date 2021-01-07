class StaticPagesController < ApplicationController
  def home
    #1 . check if user is logged in
    if logged_in?
      # 2. create micropost if there is current_user
      @micropost = current_user.microposts.build

      # feed_items -> shows you microposts in Home page
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 12)

      # 3. you can see microposts of others, others can see your micropost
      @user = current_user
    end
  end

  def about
  end

  def contact
  end
end
