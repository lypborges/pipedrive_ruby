require 'spec_helper'

describe PipedriveRuby do
  context "version" do
    it 'has a version number' do
      expect(PipedriveRuby::VERSION).not_to be_nil
    end
    it 'has 1.0.0alpha' do
      expect(PipedriveRuby::VERSION).to include("1.0.0alpha")
    end
  end
end
