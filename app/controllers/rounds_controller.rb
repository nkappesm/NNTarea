class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.includes(:round_players).all
  end

  def show
  end

  # GET /rounds/new
  def new
    @round = Round.play_round
    @round.save
    @players = Player.all
    @players.where(active: true).each do |pl|
      @round.round_players.create(player: pl)
    end
    @round.round_players.each do |rp|
      if rp.player.active == true
        rva = RoundPlayer.obtain_bets(rp.player)
        rp.bet_amount = rva[0]
        wl = RoundPlayer.obtain_results(rva[1], @round.result)
        if wl == 15
          rp.bet_result = "Big winner"
        elsif wl == 2
          rp.bet_result = "Winner"
        else
          rp.bet_result = "Looser"
        end
        rp.bet_value = rva[1]
        rp.player.money = (rp.player.money + rva[0]*(wl - 1))
        rp.round_money = rp.player.money
        if rp.player.money <= 0
          rp.player.active = false
        end
        rp.player.save
        rp.save
      end
    end
    redirect_to rounds_url
  end

  def play
  end
=begin
  # GET /rounds/1
  # GET /rounds/1.json
  def show
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(round_params)

    respond_to do |format|
      if @round.save
        format.html { redirect_to @round, notice: 'Round was successfully created.' }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to rounds_url, notice: 'Round was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
=end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      #@round = Round.find(params[:id])
      redirect_to rounds_url
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:result)
    end
end
