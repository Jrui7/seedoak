class SeedsController < ApplicationController

  before_action :set_sample, only: [:index, :last_day, :popular, :newest]

  def index
    @categories = Category.all
    @filter = params[:category]
    @seeds = policy_scope(Seed).seed_selection
  end


  def new
    @seed = Seed.new
    authorize @seed
  end


  def create
     @seed = Seed.new(seed_params)
     @seed.user = current_user
     authorize @seed
    if @seed.save
      @seed.set_expiration
      @seed.set_view_counter
      @seed.set_popularity
      @seed.save
      Campaign.create(seed_id: @seed.id)
      flash[:notice] = "Votre seed est maintenant en ligne"
      redirect_to seed_path(@seed)
    else
      render :new
    end
  end

  def show
    @seed = Seed.find(params[:id])
    authorize @seed
    @seeder = @seed.user
    @seed.increment_views
    @seed.increment_popularity
    @pick = Pick.new
    @user = current_user
  end

  def update
    seed = Seed.find(params["id"])
    admin_review = params["seed"]["admin_review"]


    if admin_review == "Valide"
      seed.update(admin_review_params)
      redirect_to signaled_path

    else
      seed.refund_seed
      seed.update(admin_review_params)
      redirect_to signaled_path
    end

  end


  def destroy
  end

  def last_day
    @categories = Category.all
    @seeds = Seed.seed_selection.last_day
  end

  def popular
    @categories = Category.all
    @seeds = Seed.seed_selection.popular
  end

  def newest
    @categories = Category.all
    @seeds = Seed.seed_selection.newest
  end


  private

  def seed_params
    params.require(:seed).permit(:title, :price, :description, :official_description, :sale_point, :sale_point_url, :sale_point_address, :sale_point_contact, :category_id, :url, :secondary_url, photos: [])
  end

  def admin_review_params
    params.require(:seed).permit(:admin_review)
  end

  def set_sample
    if Seed.ongoing.any? == true
      @sample = Seed.seed_selection.sample
    else
      @sample = Seed.seed_sample_expired.sample
    end
  end


end

