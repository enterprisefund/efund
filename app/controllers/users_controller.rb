class CDIS
  include HTTParty
  base_uri 'http://plmc.intel.com/SharedServices/cdisapi/v1/workers/'
  basic_auth 'username', 'password'
  
  def initialize(u, p)
    @auth = {:username => u, :password => p}
  end

def self.getWorkerDetailsByWWID (wwid)
  response = get(wwid)
end

end

class UsersController < ApplicationController
 
  # GET /users
  # GET /users.json
  def index
    @users = User.all

  #@workers = cdisobject.getWorkerDetailsByWWID('11225259')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end



  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  @workers = CDIS.getWorkerDetailsByWWID('11225259')
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

def search
  variable_name = params[:variable_name]

  @workers = CDIS.getWorkerDetailsByWWID(variable_name)

end
  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @workers = CDIS.getWorkerDetailsByWWID('11225259')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
