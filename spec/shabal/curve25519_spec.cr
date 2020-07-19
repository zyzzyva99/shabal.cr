require "../spec_helper"

# Note that we use some test constants from https://github.com/burst-apps-team/burstkit4j
# in these tests, since we know they're correct.
describe Shabal::Curve25519 do
  it "should successfully generate symmetric shared secrets" do
    expected_key = "f057d9854fa4d7cf86a822500dae7b6c3325a21a1f13f5fc98b587bc0569113a".hexbytes
    private_key1 = Shabal::Utils.passphrase_to_private_key("passphrase1")
    private_key2 = Shabal::Utils.passphrase_to_private_key("passphrase2")
    public_key1 = Shabal::Curve25519.get_public_key(private_key1)
    public_key2 = Shabal::Curve25519.get_public_key(private_key2)

    shared_secret1 = Shabal::Curve25519.get_shared_secret(private_key1, public_key2)
    shared_secret2 = Shabal::Curve25519.get_shared_secret(private_key2, public_key1)

    shared_secret1.should eq(expected_key)
    shared_secret2.should eq(expected_key)
  end

  it "should correctly sign and then verify a message" do
    message = Shabal::Utils.sha256("Let's see if this works...")
    private_key = Shabal::Utils.passphrase_to_private_key("My completely unguessable passphrase")

    public_key = Shabal::Curve25519.get_public_key(private_key)
    signature = Shabal::Curve25519.sign(private_key, message)
    result = Shabal::Curve25519.verify(public_key, signature, message, true)

    result.should be_true
  end
end
