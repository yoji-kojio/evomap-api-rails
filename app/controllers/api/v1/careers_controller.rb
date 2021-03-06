class Api::V1::CareersController < Api::V1::ApiController
  before_action :set_career, only: [:show, :update, :destroy, :get_career_contents]

  # GET /api/v1/careers
  def index
    @career = current_user.careers
    render json: @career
  end

  # GET /api/v1/careers/1
  def show
    render json: @career
  end

  # POST /api/v1/careers
  def create
    @career = Career.new(career_params)

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

  # GET /apli/v1/careers/1/get_career_contents
  def get_career_contents
    contents = @career.contents
    render json: contents
  end

  private

  def set_career
    @career = Career.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def career_params
    params.require(:career).permit(:name, :description)
  end
end
