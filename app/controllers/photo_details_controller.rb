require 'date'

class PhotoDetailsController < ApplicationController
  before_action :set_photo_detail, only: [:show, :edit, :update, :destroy]

  # GET /photo_details
  # GET /photo_details.json
  def index
    @photo_details = PhotoDetail.all
  end

  # GET /photo_details/1
  # GET /photo_details/1.json
  def show
  end

  # GET /photo_details/new
  def new
    @pic_url = params[:p]
    logger.debug "the the the #{@pic_url}"
    @photo_detail = PhotoDetail.new
  end

  # GET /photo_details/1/edit
  def edit
  end

  # POST /photo_details
  # POST /photo_details.json
  def create
    start_date = Date.civil(params[:date_taken]["(1i)"].to_i,
                         params[:date_taken]["(2i)"].to_i,
                         params[:date_taken]["(3i)"].to_i)

    @photo_detail = PhotoDetail.new(title: params[:title], date_taken: start_date, place_taken: params[:place], link: '/uploads/'+session[:filename], story: params[:details])

    respond_to do |format|
      if @photo_detail.save
        format.html { 
          flash[:notice] = "Post successfully created"
          redirect_to new_photo_detail_path
        }
        format.json { render :show, status: :created, location: @photo_detail }
      else
        format.html { render :new }
        format.json { render json: @photo_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_details/1
  # PATCH/PUT /photo_details/1.json
  def update
    respond_to do |format|
      if @photo_detail.update(photo_detail_params)
        format.html { redirect_to new_photo_detail_path, notice: 'Photo detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_detail }
      else
        format.html { render :edit }
        format.json { render json: @photo_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_details/1
  # DELETE /photo_details/1.json
  def destroy
    @photo_detail.destroy
    respond_to do |format|
      format.html { redirect_to photo_details_url, notice: 'Photo detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #User Defined Functions
  def upload
    uploaded_io = params[:picture_upload]
    
    if uploaded_io.nil?
      redirect_to new_photo_detail_path,notice: 'Please select a Photo.'
    else
      file_name = DateTime.now.strftime('%Y-%m-%d:%H:%M:%S') +'_image.png'
      file_path = Rails.root.join('public', 'uploads', file_name)
      image = MiniMagick::Image.open(uploaded_io.tempfile.path)
      #image.path #=> "/var/folders/k7/6zx6dx6x7ys3rv3srh0nyfj00000gn/T/magick20140921-75881-1yho3zc.jpg"
      image.resize "500x500"
      image.format "png"
      image.write file_path
      session[:filename] = file_name
      
      #file_name = DateTime.now.strftime('%Y-%m-%d:%H:%M:%S') + '_'+uploaded_io.original_filename
      #File.open(Rails.root.join('public', 'uploads', file_name), 'wb') do |file|
      #  session[:filename] = file_name
      #  file.write(uploaded_io.read)
      #end
      redirect_to new_photo_detail_path(:p => session[:filename])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_detail
      @photo_detail = PhotoDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_detail_params
      params.require(:photo_detail).permit(:title, :date_taken, :place, :link, :details)
    end
end
