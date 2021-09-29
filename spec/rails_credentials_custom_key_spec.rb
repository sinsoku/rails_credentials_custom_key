# frozen_string_literal: true

RSpec.describe RailsCredentialsCustomKey do
  describe "#require?" do
    it { is_expected.to be_required }
  end

  describe "#init!" do
    context "with block" do
      it "overwrites EncryptedFile#key" do
        RailsCredentialsCustomKey.init! { "new_key" }

        Tempfile.open do |f|
          enc_file = ActiveSupport::EncryptedFile.new(
            content_path: f.path,
            key_path: "",
            env_key: "",
            raise_if_missing_key: false
          )
          expect(enc_file.key).to eq "new_key"
        end
      end
    end

    context "without block" do
      it "raises ArgumentError" do
        expect { RailsCredentialsCustomKey.init! }
          .to raise_error(ArgumentError, "no block given")
      end
    end
  end
end
