require 'spec_helper'

describe PipedriveRuby do
  context "version" do
    it 'has a version number' do
      expect(PipedriveRuby::VERSION).not_to be_nil
    end
  end
end
