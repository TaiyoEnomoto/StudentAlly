class PostsController < ApplicationController

	def index 
		@posts = Post.all
		search = params[:search]
		@posts = @posts.joins(:user).where("subject LIKE ?", "%#{search}%") if search.present?
	end

	def link
	end

	def new
		@post = Post.new
  end

	def create
		post = Post.new(post_params)
		post.user_id = current_user.id
		if post.save!
			redirect_to :action => "index"
		else
			redirect_to :action => "new"
		end
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@comment = Comment.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		if post.update(post_params)
			redirect_to :action => "show", :id => post.id
		else
			redirect_to :action => "new"
		end
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to action: :index
	end

	def dentsu
		@posts=Post.where(name: '電気通信大学')
	end

	def toritsu
		@posts=Post.where(name: '東京都立大学')
	end

	def yokokoku
		@posts=Post.where(name: '横浜国立大学')
	end

	def noko
		@posts=Post.where(name: '東京農工大学')
	end

	def chiba
		@posts=Post.where(name: '千葉大学')
	end

	def gaigodai
		@posts=Post.where(name: '東京外国語大学')
	end

	def kaiyodai
		@posts=Post.where(name: '東京海洋大学')
	end

	def yokoichi
		@posts=Post.where(name: '横浜市立大学')
	end

	private
	def post_params
		params.require(:post).permit(:name, :subject, :kinds, :about, :image)
	end


end