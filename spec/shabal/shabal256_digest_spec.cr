require "../spec_helper"

# Note that we use some test constants from https://github.com/burst-apps-team/burstkit4j
# in these tests, since we know they're correct.
describe Shabal::Shabal256Digest do
  it "should generate correct Shabal256 digests from strings" do
    Shabal::Shabal256Digest.hexdigest("").should eq("aec750d11feee9f16271922fbaf5a9be142f62019ef8d720f858940070889014")
    Shabal::Shabal256Digest.hexdigest("Testing").should eq("10e237979a7233aa6a9377ff6a4b2541f890f67107fe0c89008fdd2c48e4cfe5")
    Shabal::Shabal256Digest.hexdigest("Burstcoin!").should eq("9beec9e237da7542a045b89c709b5d423b22faa99d5f01abab67261e1a9de6b8")
  end
end
