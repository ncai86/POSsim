require "spec_helper"


describe ReceiptsController do
  #include ReceiptsControllerHelper

  let(:post_params) {
    {
        :ReceiptRequest =>
            {
                :ReceiptNumber => '1234567891234567891234567890',
                :GoodsType => 1
            }
    }
  }

  let(:req_path) { "http://example.org/receipts/get_receipt" }

  before do
    @receipt = create(:receipt, :receipt_number => '1234567891234567891234567890')
  end

  describe 'XML POST REQUEST' do
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
      expect(response).to render_template("error")
    end

    it 'renders error template with receipt number not in correct format' do
      post_params[:ReceiptRequest][:ReceiptNumber] = post_params[:ReceiptRequest][:ReceiptNumber].to_i

      post :get_receipt, post_params.merge(:format => :xml)
      expect(response).to be_success
      expect(response).to render_template("error")
    end

    it 'renders error template with receipt number not in correct format' do
      post_params[:ReceiptRequest][:GoodsType] = post_params[:ReceiptRequest][:GoodsType].to_s

      post :get_receipt, post_params.merge(:format => :xml)
      expect(response).to be_success
      expect(response).to render_template("error")
    end

    it 'renders error template with 01 error code when length is not valid' do
      post_params[:ReceiptRequest][:ReceiptNumber] = post_params[:ReceiptRequest][:ReceiptNumber] + '1'

      post :get_receipt, post_params.merge(:format => :xml)
      expect(response).to be_success
      expect(response).to render_template("error")
    end

    it 'renders error template with 01 error code when length is not valid' do
      post_params[:ReceiptRequest][:ReceiptNumber].chop! << '5'

      post :get_receipt, post_params.merge(:format => :xml)
      expect(response).to be_success
      expect(response).to render_template("error")
    end

    context "post params node differ from VALID_PARAMETERS" do

      it 'returns error response when request contains differing node names ' do
        post_params = {
            :ReceiptRequest =>
                {
                    :BadReceiptNumber => '1234567891234567891234567890',
                    :BadGoodsType => 1
                }
        }

        post :get_receipt, post_params.merge(:format => :xml)
        expect(response).to be_success
        expect(response).to render_template("error")
      end

      it 'returns error response when request contains differing number of nodes' do
        post_params[:ReceiptRequest].merge! :ExtraNode => 'extra node added'
        post :get_receipt, post_params.merge(:format => :xml)
        expect(response).to be_success
        expect(response).to render_template("error")
      end
    end

    context "VALID_PARAMETERS length not filled in optional" do
      it "returns response successfully" do
        stub_const("VALID_PARAMETERS", [
            {:param_name => "ReceiptNumber", :class => String},
            {:param_name => "GoodsType", :class => Fixnum}
        ])

        post :get_receipt, post_params.merge(:format => :xml)
        expect(response).to be_success
        expect(response).to render_template("get_receipt")
      end
    end

  end


end