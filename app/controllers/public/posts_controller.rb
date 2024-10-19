class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  # ログインユーザーのみ操作可能
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  # ------------------------------------------------------------------------------------------------------------------
  def new
    @user = current_user
    @post = Post.new
    @post = @user.posts.new
  end
  # ------------------------------------------------------------------------------------------------------------------
  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    
    # 保存処理
    if @post.save
      flash[:notice] = "投稿が保存されました！"
      redirect_to post_path(@post) and return
    else
      flash.now[:alert] = "投稿の保存に失敗しました。"
      render :new
    end
  end
  # ------------------------------------------------------------------------------------------------------------------
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  # ------------------------------------------------------------------------------------------------------------------
  def index
    @posts = Post.all
  end
  # ------------------------------------------------------------------------------------------------------------------
  def edit
    @post = Post.find(params[:id])
  end
  # ------------------------------------------------------------------------------------------------------------------
  def update()
    @post = Post.find(params[:id])
    
     # 編集処理
    if @post.update(post_params)
      flash[:notice] = "投稿の編集が完了しました！"
      redirect_to post_path(@post) and return
    else
      flash.now[:alert] = "投稿の編集に失敗しました。"
      render :edit
    end
  end
  # ------------------------------------------------------------------------------------------------------------------
  def destroy
  end

  def tags
  end

  def tags_search
  end
  # ------------------------------------------------------------------------------------------------------------------
  private
  
  def post_params
    params.require(:post).permit(:title, :url, :creator, :content, :recommended_reasons, :star, :image)
  end
  
  # ログインユーザーのみ操作可能
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
  # ------------------------------------------------------------------------------------------------------------------
end
