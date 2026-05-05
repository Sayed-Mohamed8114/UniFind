class ClaimsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:new, :create]

  def new
    @claim = Claim.new
  end

  def create
    @claim = Claim.new(claim_params)
    @claim.user = current_user
    @claim.item = @item

    if @claim.save
      # 🔔 Create notification for item owner
      Notification.create(
        user: @item.user,          # receiver (item owner)
        sender: current_user,      # who made the claim
        item: @item,
        notification_type: :claim
      )

      redirect_to dashboard_path, notice: "Claim submitted successfully"
    else
      render :new
    end
  end

  def my_items_claims
    @claims = Claim.joins(:item)
                   .where(items: { user_id: current_user.id })
                   .includes(:user, :item)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def claim_params
    params.require(:claim).permit(:content)
  end
end