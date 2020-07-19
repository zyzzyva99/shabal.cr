require "../spec_helper"

describe "Shabal::LibShabal" do
  it "should correctly sign and verify a message digest with curve25519" do
    message_digest = sha256_hash("Let's see if this works...".to_slice)
    private_key = sha256_hash("My completely unguessable passphrase".to_slice)

    public_key_ptr = Pointer(UInt8).malloc(32)
    Shabal::LibShabal.curve25519_get_public_key(private_key.to_unsafe, public_key_ptr)

    signature_ptr = Pointer(UInt8).malloc(64)
    Shabal::LibShabal.curve25519_sign(private_key.to_unsafe, message_digest.to_unsafe, signature_ptr)

    result = Shabal::LibShabal.curve25519_verify(public_key_ptr, signature_ptr, message_digest.to_unsafe, 1)

    result.should_not eq(0)
  end
end
