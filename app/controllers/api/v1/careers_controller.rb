class Api::V1::CareersController < Api::V1::ApiController
  before_action :set_career, only: [:show, :update, :destroy]
  before_action :require_authorization!, only: [:show, :update, :destroy]

  # GET /api/v1/careers
  def index
    @career = current_user.career
    binding.pry
    render json: @career
  end

  # GET /api/v1/careers/1
  def show
    render json: @career
  end

  # POST /api/v1/careers
  def create
    @career = Career.new(career_params.merge(user: current_user))

    if @career.save
      render json: @career, status: :created
    else
      render json: @career.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /api/v1/careers/1
  def update
    if @career.update(career_params)
      render json: @career
    else
      render json: @career.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/careers/1
  def destroy
    @career.destroy
  end

  private

  def set_career
    @career = Career.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def career_params
    params.require(:career).permit(:name, :description)
  end

  def require_authorization!
    unless current_user == @career.user
      render json: {}, status: :forbidden
    end
  end
end
