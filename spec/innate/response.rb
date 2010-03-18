require File.expand_path('../../helper', __FILE__)

class SpecResponse
  Innate.node '/'

  def index
    "some text"
  end
end

describe Innate::Response do
  describe 'Content-Type' do
    behaves_like :rack_test

    it 'responds with text/html by default' do
      got = get('/')
      got['Content-Type'].should == 'text/html'
    end

    it 'changes when option is changed' do
      Innate::Response.options.headers['Content-Type'] = 'text/plain'
      got = get('/')
      got['Content-Type'].should == 'text/plain'
    end
  end
end
