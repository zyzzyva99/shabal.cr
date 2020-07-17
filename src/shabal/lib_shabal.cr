# Note that docstrings are copied from libshabal.h, where available.

@[Link("shabal")]
lib LibShabal
  type UIntPtrT = LibC::ULong

  # Creates a single PoC Nonce.
  #
  # `plot_buffer` must be correct size - no size checks are performed.
  fun create_plot(
    account_id : UInt64,
    nonce : UInt64,
    poc_version : UInt8,
    plot_buffer : UInt8*,
    plot_buffer_offset : UIntPtrT
  ) : Void

  # Creates PoC Nonces, with SIMD instructions for extra speed.
  #
  # `plot_buffer` must be correct size - no size checks are performed.
  #
  # `nonce_count` counts from 1 - 0 is no plots and will do nothing.
  fun create_plots(
    account_id : UInt64,
    start_nonce : UInt64,
    nonce_count : UInt64,
    poc_version : UInt8,
    plot_buffer : UInt8*,
    plot_buffer_offset : UIntPtrT
  ) : Void

  # Creates a single PoC Scoop.
  #
  # `plot_buffer` must be correct size - no size checks are performed.
  fun create_scoop(
    account_id : UInt64,
    nonce : UInt64,
    scoop : UInt32,
    poc_version : UInt8,
    sccop_buffer : UInt8*,
    sccop_buffer_offset : UIntPtrT
  ) : Void

  fun curve25519_get_public_key(private_key : UInt8*, public_key : UInt8*) : Void
  fun curve25519_get_shared_secret(
    private_key : UInt8*,
    public_key : UInt8*,
    shared_secret_buffer : UInt8*
  ) : Void
  fun curve25519_sign(
    private_key : UInt8*,
    message_sha256 : UInt8*,
    signature_buffer : UInt8*
  ) : Void

  # `enforce_canonical` and the return value are u8 bools where 0 represents false and 1 represents true.
  # So, a return value of 1 indicates successful verification and a return value of 0 indicates unsuccessful verification.
  fun curve25519_verify(
    public_key : UInt8*,
    signature : UInt8*,
    message_sha256 : UInt8*,
    enforce_canonical : UInt8
  ) : UInt8

  fun libshabal_version : UInt8*

  # Destroy a Shabal256 instance, clearing memory allocated for it.
  #
  # `shabal` is the pointer to the instance returned from `shabal256_new()`
  fun shabal256_destroy(shabal : Void*) : Void

  # Retrieve the result of a Shabal256 digest and reset the digest.
  #
  # Stores the data in `buffer` starting from `offset`. Stores 32 bytes of hash data.
  #
  # `buffer` must have 32 bytes available from `offset` otherwise this will attempt to write beyond the array.
  fun shabal256_digest(shabal : Void*, buffer : UInt8*, offset : UIntPtrT) : Void

  # Create a new Shabal256 instance
  #
  # Returns a pointer to the instance, which
  # can be used with the other functions to
  # manipulate the instance.
  #
  # This implementation of Shabal256 is not particularly
  # fast but is here for completeness.
  fun shabal256_new : Void*

  # Reset a Shabal256 instance to its initial state
  #
  # `shabal` is the pointer to the instance returned from `shabal256_new()`
  fun shabal256_reset(shabal : Void*) : Void

  # Update a Shabal256 instance with new input data
  #
  # `shabal` is the pointer to the instance returned from `shabal256_new()`
  #
  # Inputs data into the digest from `data` starting at `offset` of length `len`
  fun shabal256_update(
    shabal : Void*,
    data : UInt8*,
    offset : UIntPtrT,
    len : UIntPtrT
  ) : Void

  fun shabal_findBestDeadline(
    scoops : UInt8*,
    nonce_count : UInt64,
    gensig : UInt8*
  ) : UInt64
  fun shabal_findBestDeadlineDirect(
    scoops : UInt8*,
    nonce_count : UInt64,
    gensig : UInt8*,
    best_deadline : UInt64*,
    best_offset : UInt64*
  ) : Void
  fun shabal_init : Void
end
