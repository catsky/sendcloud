require File.expand_path('../spec_helper.rb', __FILE__)

describe  Sendcloud::Mail do

  describe 'send' do

    it 'should return success' do
      response = Sendcloud::Mail.send({
                               :to => 'chilaoshi@outlook.com',
                               :from => 'chilaoshi@outlook.com',
                               :subject => '来自SendCloud的第一封邮件！',
                               :html => '你太棒了！你已成功的从SendCloud发送了一封测试邮件，接下来快登录前台去完善账户信息吧！'
                           })
      expect(response['message']).to eq('请求成功')
    end
  end
  
  describe 'send template' do

    it 'should return success' do
      response = Sendcloud::Mail.send_template({
                                xsmtpapi: { to: ['zhdhui@outlook.com'],  
                                           sub: {"%name%" => ['catsky']}
                                          }.to_json,
                               from: 'test@sendcloud.org',
                               templateInvokeName: 'test_template_active'
                           })
      expect(response['message']).to eq('请求成功')
    end

  end

end