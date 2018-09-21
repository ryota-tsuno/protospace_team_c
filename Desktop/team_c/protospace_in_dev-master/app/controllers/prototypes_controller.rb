class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :update, :edit]


  def index
    @prototypes = Prototype.page(params[:page]).per(8)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      render :new 
     end
  end

  def show
  end

  def edit
  end

  def update
    if @prototype.update(prototype_update_params)
       redirect_to root_path, notice: "編集成功したよ〜〜〜〜〜〜〜い！!"
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy if @prototype.user_id == current_user.id
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status]
    )
  end

   def prototype_update_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status, :id]
    )
  end
end
