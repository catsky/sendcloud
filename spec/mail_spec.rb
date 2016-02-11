require File.expand_path('../spec_helper.rb', __FILE__)

describe  Sendcloud::Mail do

  describe 'send' do

    it 'should return success' do
      response = Sendcloud::Mail.send({
                               :to => 'chilaoshi@outlook.com',
                               :from => 'chilaoshi@outlook.com',
                               :subject => 'test',
                               :html => 'rspec test'
                           })
      expect(response['message']).to eq('success')
    end

  end

end