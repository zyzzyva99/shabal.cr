require "openssl"

# A small collection of utilities to be used with libshabal.
module Shabal::Utils
  # Return a sha256 message digest from the specified message
  def self.sha256(message : Bytes) : Bytes
    digest = OpenSSL::Digest.new("SHA256")
    digest.update(message)
    digest.final
  end

  # Return a sha256 message digest from the specified string
  def self.sha256(message : String) : Bytes
    self.sha256(message.to_slice)
  end

  # Clamp a private key. Note that since `Bytes` is passed as a value, this
  # method does not clamp the private key in place; instead, it returns a
  # clamped copy.
  # Why do we need to clamp private keys? Good question! See
  # https://neilmadden.blog/2020/05/28/whats-the-curve25519-clamping-all-about/
  def self.clamp_private_key(private_key : Bytes) : Bytes
    private_key[31] &= 0x7f
    private_key[31] |= 0x40
    private_key[0] &= 0xf8
    private_key
  end

  # Obtain a private key suitable for curve25519 operations from a passphrase.
  def self.passphrase_to_private_key(passphrase : String) : Bytes
    private_key = self.sha256(passphrase)
    self.clamp_private_key(private_key)
  end
end
