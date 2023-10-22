# frozen_string_literal: true

# ChildDetailsController handles the details to be entered for a child.
class ChildDetailsController < ApplicationController
  before_action :set_child_detail, only: %i[show edit update destroy]

  # GET /child_details or /child_details.json
  def index
    @child_details = ChildDetail.all
  end

  # GET /child_details/1 or /child_details/1.json
  def show; end

  # GET /child_details/new
  def new
    @child_detail = ChildDetail.new
  end

  # GET /child_details/1/edit
  def edit; end

  # POST /child_details or /child_details.json
  def create
    @child_detail = ChildDetail.new(child_detail_params)

    respond_to do |format|
      if @child_detail.save
        format.html { redirect_to child_detail_url(@child_detail), notice: 'Child detail was successfully created.' }
        format.json { render :show, status: :created, location: @child_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @child_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /child_details/1 or /child_details/1.json
  def update
    respond_to do |format|
      if @child_detail.update(child_detail_params)
        format.html { redirect_to child_detail_url(@child_detail), notice: 'Child detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @child_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @child_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /child_details/1 or /child_details/1.json
  def destroy
    @child_detail.destroy!

    respond_to do |format|
      format.html { redirect_to child_details_url, notice: 'Child detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_child_detail
    @child_detail = ChildDetail.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def child_detail_params
    params.require(:child_detail).permit(:PrescriberName, :ScreenDate, :ScreenComment, :Sealants, :UntreatedDecay,
                                         :TreatedDecay, :Referral, :DecayedNum, :ProviderName, :ProviderDate, :FirstSealedNum, :SecondSealedNum, :OtherPermNum, :PrimarySealed, :FluorideVarnish, :Prophylaxes, :PreventativeComment, :EvaluatorsName, :EvaluatorDate, :EvaluatorComment, :RetainedSealant, :ReferredDT, :ReferredUDT, :SealantsRecd, :SealnatsNeeded, :Experienced, :UntreatedDecay, :Services, :ORHealthStatus)
  end
end
