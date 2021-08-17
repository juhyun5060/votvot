class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index ]
  before_action :correct_user, only: %i[ edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        # format.html { redirect_to controller 'subjects', action 'new', post_id: params[:@post.id], notice: "Post was successfully created." }
        format.html { redirect_to "/posts/#{@post.id}/subjects/new", notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like_toggle
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    if like.nil?
        Like.create(user_id: current_user.id, post_id: params[:post_id])
    else
        like.destroy
    end

    redirect_to '/posts/'+params[:post_id]
  end

  # 조회수 설정
  def log_impression
    @hit_post = Post.find(params[:id])
    @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end

  # 투표
  def vote
    voted_sub = Subject.find_by(sub_con: params[:subject])
    voted_sub.votes += 1
    voted_sub.save
    redirect_back(fallback_location: root_path)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :photo, :user_id)
    end

    # user authenticate
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "접근 권한이 없습니다." if @post.nil?
    end

end