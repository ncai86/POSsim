require "spec_helper"


describe ReceiptsController do
  #include ReceiptsControllerHelper

  let(:post_params) {
    {
        :ReceiptRequest =>
            {
                :ReceiptNumber => '123123',
                :GoodsType => 1
            }
    }
  }

  let(:req_path) { "http://example.org/receipts/get_receipt" }

  before do
    @receipt = create(:receipt, :receipt_number => '123123')
  end

  context 'XML POST REQUEST' do
    it 'returns response successfully' do
      #request.env['RAW_POST_DATA'] = post_params.to_xml(:root => 'ReceiptRequest')
      #Rails.logger.info request.env['RAW_POST_DATA']
      #raw_post :get_receipt, {}, post_params.to_xml(:root => 'ReceiptRequest')
      post :get_receipt, post_params.merge(:format => :xml)
      expect(response).to be_success
      #response.code.should == "200"
      expect(response).to render_template("get_receipt")
    end

    it 'renders error template with params not present' do
      post_params = {}
      post :get_receipt, post_params.merge(:format => :xml)
      expect(response).to be_success
      #response.code.should == "200"
      expect(response).to render_template("error")
    end

    it 'renders error template with receipt number not in correct format' do
      post_params[:ReceiptRequest][:ReceiptNumber] = post_params[:ReceiptRequest][:ReceiptNumber].to_i

      post :get_receipt, post_params.merge(:format => :xml)
      expect(response).to be_success
      #response.code.should == "200"
      expect(response).to render_template("error")
    end

    it 'renders error template with receipt number not in correct format' do
      post_params[:ReceiptRequest][:GoodsType] = post_params[:ReceiptRequest][:GoodsType].to_s

      post :get_receipt, post_params.merge(:format => :xml)
      expect(response).to be_success
      #response.code.should == "200"
      expect(response).to render_template("error")
    end

    it 'renders error template with 01 error code when record does not exist' do
      post_params[:ReceiptRequest][:ReceiptNumber] = post_params[:ReceiptRequest][:ReceiptNumber] + '1'

      post :get_receipt, post_params.merge(:format => :xml)
      expect(response).to be_success
      #response.code.should == "200"
      expect(response).to render_template("error")
    end


  end


end