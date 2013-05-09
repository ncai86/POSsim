class ReceiptsController < ApplicationController
  respond_to :xml, :json

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
    set_parameter_variables

    #Validate number of parameters
    if @receipt_request.present?
      if @receipt_request.count != VALID_PARAMETERS.count
        @error = "System Error: [return code]"
      end

<<<<<<< HEAD
    logger.info @receipt_length
    #checking if GoodsType is luxury or standard
    #Checks for Presence of Mandatory data for query
    receipt_number = params[:ReceiptRequest][:ReceiptNumber] rescue nil
    goods_type = params[:ReceiptRequest][:GoodsType] rescue nil
    # if (receipt_number == nil || goods_type == nil) || (receipt_number.class != String || goods_type.class != Fixnum) || (receipt_number.try(:length) != @receipt_length)
    if (receipt_number == nil) || (receipt_number.class != String) || (receipt_number.try(:length) != @receipt_length)
=======
      #  Check params name == valid_parameters name
      #  Check params class == valid_parameters class
      #  Check params length == valid_parameters length if length is present
      VALID_PARAMETERS.each do |valid_parameter|
        if (@receipt_request[valid_parameter[:param_name]] == nil) ||
            (@receipt_request[valid_parameter[:param_name]].class != valid_parameter[:class]) ||
            (valid_parameter[:length].present? ? (@receipt_request[valid_parameter[:param_name]].to_s.length != valid_parameter[:length]) : false)
          @error = "System Error: [return code]"
        end
      end
    else
>>>>>>> development
      @error = "System Error: [return code]"
    end

    render 'error' and return if @error.present?

      #Set Receipt Length according to template selected
    #@receipt_length = case Receipt.template
    #  when 'lotte'
    #    Settings.receipt_length.lotte
    #  when 'testing'
    #    Settings.receipt_length.test
    #end

<<<<<<< HEAD
    # if goods_type == 1 #standard
    #   luxury_filter = 0
    # elsif goods_type == 2 #luxury
    #   luxury_filter = 1
    # end
=======
    #checking if GoodsType is luxury or standard
    #Checks for Presence of Mandatory data for query
    #receipt_number = params[:ReceiptRequest][:ReceiptNumber] rescue nil
    #goods_type = params[:ReceiptRequest][:GoodsType] rescue nil
    #if (receipt_number == nil || goods_type == nil) || (receipt_number.class != String || goods_type.class != Fixnum) || (receipt_number.try(:length) != @receipt_length)
    #  @error = "System Error: [return code]"
    #  render 'error' and return
    #end

    #initialize luxury_filter
    luxury_filter = nil
    if @goods_type.present?
      if @goods_type == 1 #standard
        luxury_filter = 0
      elsif @goods_type == 2 #luxury
        luxury_filter = 1
      end
    end
>>>>>>> development

    @receipt = Receipt.find_by_receipt_number(@receipt_number)
    unless @receipt
      @error = "No Data: 01"
      render 'error' and return
    end

    #Checks receipt presence using data
    #Items Luxury or Standard
<<<<<<< HEAD
    # @purchase_items = luxury_filter.present? ? @receipt.purchase_items.where(:is_luxury => luxury_filter) : @receipt.purchase_items
    @purchase_items = @receipt.purchase_items
    render "#{Receipt.template}_get_receipt"
=======
    @purchase_items = luxury_filter.present? ? @receipt.purchase_items.where(:is_luxury => luxury_filter) : @receipt.purchase_items
  end

  private

  def set_parameter_variables
    @receipt_request = params[:ReceiptRequest]
    @receipt_request.each do |key, value|
      instance_variable_set "@#{key.underscore}", value
    end if @receipt_request.present?
>>>>>>> development
  end
end
