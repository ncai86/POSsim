<<<<<<< HEAD
class ReceiptsController < ApplicationController
  respond_to :xml

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
    response.headers["Content-Type"] = 'text/xml'
    receipt_number = params[:ReceiptRequest][:ReceiptNumber] rescue nil
    # goods_type = params[:ReceiptRequest][:GoodsType] rescue nil

    logger.info 'TESTING123123123'
    # unless (receipt_number && goods_type) && (receipt_number.class == String && goods_type.class == Fixnum)
    unless (receipt_number)|| (receipt_number.class == String)  || (receipt_number.try(:length) != VALID_RECEIPT_CHAR_LENGTH )
      @error = "System Error: [return code]"
      render 'error' and return
    end

    #logger.info "testing123"
    #logger.info params
    #logger.info params[:ReceiptRequest][:ReceiptNumber]
    #logger.info params[:GoodsType].class
    #logger.info request.raw_post

    # if goods_type == 1 #standard
    #   luxury_filter = 0
    # elsif goods_type == 2 #luxury
    #   luxury_filter = 1
    # end

    #logger.info "############{luxury_filter}###########"

    @receipt = Receipt.find_by_receipt_number(params[:ReceiptRequest][:ReceiptNumber])
    unless @receipt
      @error = "No Data: 01"
      render 'error' and return
    end

    #Checks receipt presence using data
    #Items Luxury or Standard
    # @purchase_items = luxury_filter.present? ? @receipt.purchase_items.where(:is_luxury => luxury_filter) : @receipt.purchase_items
    @purchase_items = @receipt.purchase_items
  end
end
=======
class ReceiptsController < ApplicationController
  respond_to :xml, :json

  #def edit_receipt_length
  #  logger.info 'showing edit receipt page'
  #  @receipt_length
  #end
  #
  #def set_receipt_length
  #  logger.info 'setting receipt length'
  #end

  def edit_receipt_template
    @receipt_template = Receipt.template
    logger.info @receipt_template
  end

  def set_receipt_template
    Receipt.template = params[:template]

    flash[:notice] = "Template Updated"
    redirect_to receipts_edit_receipt_template_path
  end

  def get_receipt
    logger.info Receipt.template
    #Set Receipt Length according to template selected
    @receipt_length = case Receipt.template
      when 'lotte'
        Settings.receipt_length.lotte
      when 'testing'
        Settings.receipt_length.test
    end

    logger.info '###################'

    logger.info @receipt_length
    #checking if GoodsType is luxury or standard
    #Checks for Presence of Mandatory data for query
    receipt_number = params[:ReceiptRequest][:ReceiptNumber] rescue nil
    goods_type = params[:ReceiptRequest][:GoodsType] rescue nil
    if (receipt_number == nil || goods_type == nil) || (receipt_number.class != String || goods_type.class != Fixnum) || (receipt_number.try(:length) != @receipt_length)
      @error = "System Error: [return code]"
      render 'error' and return
    end

    logger.info params[:ReceiptRequest][:ReceiptNumber]
    logger.info params[:ReceiptRequest][:GoodsType]

    if goods_type == 1 #standard
      luxury_filter = 0
    elsif goods_type == 2 #luxury
      luxury_filter = 1
    end

    @receipt = Receipt.find_by_receipt_number(params[:ReceiptRequest][:ReceiptNumber])
    unless @receipt
      @error = "No Data: 01"
      render 'error' and return
    end

    #Checks receipt presence using data
    #Items Luxury or Standard
    @purchase_items = luxury_filter.present? ? @receipt.purchase_items.where(:is_luxury => luxury_filter) : @receipt.purchase_items
    render "#{Receipt.template}_get_receipt"
  end
end
>>>>>>> master
