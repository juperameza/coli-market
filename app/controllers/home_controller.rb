class HomeController < ApplicationController

  def index
    # Retrieve active posts
    @posts = Post.active

    # Calculate the number of pages needed for pagination
    @posts_count = Post.active.count % 3 == 0 ? Post.all.count/3 : Post.all.count/3 + 1
  end

  def results
    if params[:search].present?
      # Perform a search based on the provided search parameter
      @posts = Post.search(params[:search]).select { |post| post.status_id == 1 }
    else
      # If no search parameter is provided, retrieve all active posts
      @posts = Post.active
    end
  
    # Paginate the search results using Kaminari gem
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).page(params[:page]).per(3)
  end
  
end
