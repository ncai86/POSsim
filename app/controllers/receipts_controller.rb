class ReceiptsController < ApplicationController
  respond_to :xml, :json

  def get_receipt
    ##check for mandatory data
    # sends bad response if not present
    #respond_with
    #@receipt = Receipt.where(receipt_number: params[:receiptNumber])
    #if @receipt
    #  respond_with(@receipt)
    #else
    #@error = {ErrorMessage: 'something'}
    #  render :inline => Rabl::Renderer.xml(@receipt, 'receipts/error')
    ##end
    #unless params[:ReceiptNumber].present && params[:GoodsType]
    #  render 'error.rabl'
    #else
    #  @receipt = Receipt.where(receipt_number: params[:receiptNumber])
    #end

    #checking if GoodsType is luxury or standard
    goods_type = params[:GoodsType]

    if goods_type == '1'
      luxury_filter = 1
    elsif goods_type == '2'
      luxury_filter = 0
    end

    logger.info "############{luxury_filter}###########"

    @receipt = Receipt.find_by_receipt_number(params[:ReceiptNumber])

     #Items Luxury or Standard
    @purchase_items = luxury_filter.present? ? @receipt.purchase_items.where(:is_luxury => luxury_filter) : @receipt.purchase_items
  end
end
