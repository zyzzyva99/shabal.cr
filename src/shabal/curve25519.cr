# Convenience methods for libshabal's curve25519 implementation.
module Shabal::Curve25519
  # Get the public key associated with a private key.
  def self.get_public_key(private_key : Bytes) : Bytes
    public_key_ptr = Pointer(UInt8).malloc(32)
    Shabal::LibShabal.curve25519_get_public_key(private_key.to_unsafe, public_key_ptr)
    public_key_ptr.to_slice(32)
  end

  # Get the shared secret from a private key and a public key.
  def self.get_shared_secret(private_key : Bytes, public_key : Bytes) : Bytes
    shared_secret_ptr = Pointer(UInt8).malloc(32)
    Shabal::LibShabal.curve25519_get_shared_secret(
      private_key.to_unsafe,
      public_key.to_unsafe,
      shared_secret_ptr
    )
    shared_secret_ptr.to_slice(32)
  end

  # Sign a sha256 message digest with a private key, and return the signature.
  def self.sign(private_key : Bytes, message : Bytes) : Bytes
    signature_ptr = Pointer(UInt8).malloc(64)
    Shabal::LibShabal.curve25519_sign(
      private_key.to_unsafe,
      message.to_unsafe,
      signature_ptr
    )
    signature_ptr.to_slice(64)
  end

  # Verify a message signature using a public key.
  def self.verify(public_key : Bytes, signature : Bytes, message : Bytes, enforce_canonical : Bool) : Bool
    result = Shabal::LibShabal.curve25519_verify(
      public_key.to_unsafe,
      signature.to_unsafe,
      message.to_unsafe,
      enforce_canonical ? 1_u8 : 0_u8
    )
    result != 0 ? true : false
  end
end
