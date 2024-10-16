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
    @user = current_member
    @post = @user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    
    # 保存処理
    if @post.save
      # タグも保存
      @post.save_tag(tag_list) 
      flash[:notice] = "リストが保存されました！"
      redirect_to post_path(@post) and return
    else
      flash.now[:alert] = "リストの保存に失敗しました。"
      render :new
    end
  end
  # ------------------------------------------------------------------------------------------------------------------
  def show

  end

  def index
    @posts = Post.all
  end

  def edit
  end

  def update
  end

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
