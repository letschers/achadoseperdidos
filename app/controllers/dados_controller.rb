class DadosController < ApplicationController
  before_action :set_dado, only: [:show, :archive, :edit, :update, :destroy]

  include Ifosorioapi
  # GET /dados
  # GET /dados.json
  def index   
    @dados = Dado.where(status: true)
  end

  def archive
    @dado.status = false
    @dado.save

    redirect_to root_path    

  end

  def achados
    @dados = Dado.where(tipo: "achado", status: true)

    render 'index'
  end

  def perdidos  
    @dados = Dado.where(tipo: "perdido", status: true) 

    render 'index'
  end

  def arquivados
    @dados = Dado.where(status: false)

    render 'index'

  end

  # GET /dados/1
  # GET /dados/1.json
  def show
    
  end

  # GET /dados/new
  def new

    @dado = Dado.new
  end

  # GET /dados/1/edit
  def edit

    unless user_in == @dado.usuario
      redirect_to @dado

    end



  end

  # POST /dados
  # POST /dados.json
  def create
    @dado = Dado.new(dado_params)
    @dado.usuario = user_in

    respond_to do |format|
      if @dado.save
        format.html { redirect_to @dado, notice: I18n.t(:dadoCreated) }
        format.json { render :show, status: :created, location: @dado }
      else
        format.html { render :new }
        format.json { render json: @dado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dados/1
  # PATCH/PUT /dados/1.json
  def update
    respond_to do |format|
      if @dado.update(dado_params)
        format.html { redirect_to @dado, notice: I18n.t(:dadoUpdated) }
        format.json { render :show, status: :ok, location: @dado }
      else
        format.html { render :edit }
        format.json { render json: @dado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dados/1
  # DELETE /dados/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dado
      @dado = Dado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dado_params
      params.require(:dado).permit(:titulo, :foto, :descricao, :recompensa, :tipo, :dataocorrido, :pessoa, :status)
    end
  end
