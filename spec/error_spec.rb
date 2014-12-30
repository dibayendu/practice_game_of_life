require 'spec_helper'

describe GenerationError do
  it "GenerationError is a StandardError" do
    expect { raise GenerationError }.to raise_error do |e|
      expect(e).to be_a StandardError
    end
  end

  let(:custom_message) { "custom message" }
  it "raises Generation Error with message" do
    expect {raise GenerationError, custom_message}.to raise_error(GenerationError, custom_message)
  end
end

describe FileError do
  it "FileError is a StandardError" do
    expect { raise FileError }.to raise_error do |e|
      expect(e).to be_a StandardError
    end
  end

  let(:custom_message) { "custom message" }
  it "raises File Error with message" do
    expect {raise FileError, custom_message}.to raise_error(FileError, custom_message)
  end
end
