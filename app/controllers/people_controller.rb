class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]
  
  # GET /people
  # GET /people.json
  def index
    @people = Person.search(params[:q]).order(family_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @creatorship_url = "#{Rails.application.secrets.literature_host}/api/citations/search.json?q=#{({creator: @person.family_name}.to_query)}"
    @resp = Net::HTTP.get_response(URI.parse(@creatorship_url))
    @creatorship = JSON.parse(@resp.body)
    
    @mentions_url = "#{Rails.application.secrets.literature_host}/api/citations/search.json?q=#{({tag: @person.family_name}.to_query)} OR #{({tag: @person.display_name}.to_query)}"
    @resp = Net::HTTP.get_response(URI.parse(@mentions_url))
    @mentions = JSON.parse(@resp.body)

    @images_url = URI.encode("#{Rails.application.secrets.media_host}/api/media/search?q=#{@person.display_name}")
    @resp = Net::HTTP.get_response(URI.parse(@images_url))
    @images = JSON.parse(@resp.body)
       
    @portraits_url = URI.encode("#{Rails.application.secrets.media_host}/api/media/search?q=#{@person.display_name + ',Portrait'}")
    @resp = Net::HTTP.get_response(URI.parse(@portraits_url))
    @portraits = JSON.parse(@resp.body)
    
    wiki_id = Link.where(person: @person, name: 'wikipedia.org').first
    @wiki_url = wiki_id ? "https://de.wikipedia.org/api/rest_v1/page/summary/#{wiki_id.url.split('/').last}".to_param : nil
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:given_name, :first_names, :family_name, :honorific_prefix, 
        :honorific_suffix, :gender, :birthday, :deathday, :about, :place_of_birth, :place_of_death, 
        :profession_list => [], links_attributes: [:id, :url, :name, :_destroy], 
        participations_attributes: [:id, :_destroy, :from, :till, :competence, :comment], affiliations_attributes: [:id, :_destroy, :from, :till, :institution_id])
    end
end
