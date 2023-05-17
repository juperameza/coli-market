class HomeController < ApplicationController

  def index
    # Retrieve active posts
    @posts = Post.active

    # Calculate the number of pages needed for pagination
    @posts_count = Post.active.count % 3 == 0 ? Post.all.count/3 : Post.all.count/3 + 1
  end

  def results
    unless params[:search] == ""
      # Perform a search based on the provided search parameter
      @posts = Post.search(params[:search])

      # Paginate the search results using Kaminari gem
      @posts = Kaminari.paginate_array(@posts).page(params[:page])
    else
      # If no search parameter is provided, retrieve all posts and paginate them
      @posts = Post.all.page(params[:page])
    end
  end
end
