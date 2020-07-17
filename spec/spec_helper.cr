require "spec"
require "openssl"
require "../src/shabal"

def sha256_hash(message : Bytes)
  sha256 = OpenSSL::Digest.new("SHA256")
  sha256.update(message)
  sha256.final
end
