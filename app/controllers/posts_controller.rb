class PostsController < ApplicationController
    def create
        @post = Post.new(params.require(:post).permit(:image)) 
      end
      
      private
      
    def post_params
        params.require(:post).permit(:image)
    end
end
