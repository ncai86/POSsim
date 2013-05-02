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
    #debugger
    #Checks for Presence of Mandatory data for query
    receipt_number = params[:ReceiptRequest][:ReceiptNumber] rescue nil
    goods_type = params[:ReceiptRequest][:GoodsType] rescue nil
    unless (receipt_number && goods_type) && (receipt_number.class == String && goods_type.class == Fixnum)
      @error = "System Error: [return code]"
      render 'error' and return
    end

    #logger.info "testing123"
    #logger.info params
    #logger.info params[:ReceiptRequest][:ReceiptNumber]
    #logger.info params[:GoodsType].class
    #logger.info request.raw_post

    if goods_type == 1 #standard
      luxury_filter = 0
    elsif goods_type == 2 #luxury
      luxury_filter = 1
    end

    #logger.info "############{luxury_filter}###########"

    @receipt = Receipt.find_by_receipt_number(params[:ReceiptRequest][:ReceiptNumber])
    unless @receipt
      @error = "No Data: 01"
      render 'error' and return
    end

    #Checks receipt presence using data
    #Items Luxury or Standard
    @purchase_items = luxury_filter.present? ? @receipt.purchase_items.where(:is_luxury => luxury_filter) : @receipt.purchase_items
  end
end
