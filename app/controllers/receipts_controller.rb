class ReceiptsController < ApplicationController
  respond_to :xml, :json

  #def edit_receipt_template
  #  @receipt_template = Receipt.template
  #  logger.info @receipt_template
  #end
  #
  #def set_receipt_template
  #  Receipt.template = params[:template]
  #
  #  flash[:notice] = "Template Updated"
  #  redirect_to receipts_edit_receipt_template_path
  #end

  def get_receipt
    response.headers["Content-Type"] = 'text/xml'
    set_parameter_variables

    #Validate number of parameters
    if @receipt_request.present?
      if @receipt_request.count != VALID_PARAMETERS.count
        @error = "System Error: [return code]"
      end

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

    #Checks purchase_items presence using data
    #Items Luxury or Standard
    @purchase_items = eval(QUERY_STRING)
    unless @purchase_items
      @error = "No Data: 01"
      render 'error' and return
    end

  end

  private

  def set_parameter_variables
    @receipt_request = params[:ReceiptRequest].except(*REDUNDANT_REQUEST_PARAMS)
    @receipt_request.each do |key, value|
      instance_variable_set "@#{key.underscore}", value
    # creates @receipt_number, @goods_type -- VALID_PARAMETERS
    end if @receipt_request.present?
  end
end
