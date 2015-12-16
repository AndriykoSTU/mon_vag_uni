module PostsHelper
  def post_params
  	params.require(:post).permit(:title, :body, :author, :created, :id)
  end
end
