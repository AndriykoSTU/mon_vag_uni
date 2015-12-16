class PostsController < ApplicationController
  include PostsHelper

  def show
  	@post = Post.find(params[:id])
  end

  def index
  	@posts = Post.all
  end


  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.save
  	  if @post.save
  	  	flash.notice = "Post'#{@post.title}' created!"
  	  	redirect_to post_path(@post)
  	  else
  	  	render action: "new"
  	  end
  end
  	

  	def edit
  	  @post = Post.find(params[:id])  		
  	end

  	def update
  	  @post = Post.find(params[:id])
  	  @post.update(post_params)
  	    if @post.update
  	      flash.notice = "Post '#{@post.title}' updated!"
  	      redirect_to post_path(@post)
  	    else
  	      render acrion: "edit"
  	    end  		
  	end


  	def destroy
  	  @post = Post.find(params[:id])
  	  #if @post == nil
  	  #	flash.notice = "статті не існує"
  	  #	  	    redirect_to posts_path  		

  	  	
  	  #end
  	  @post.delete
  	    flash.notice = "Post '#{@post.title}' deleted!"
  	    redirect_to posts_path  		
  	end
end
