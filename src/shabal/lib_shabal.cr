@[Link("shabal")]
lib LibShabal
  type UIntPtrT = LibC::ULong

  fun create_plot(
    account_id : UInt64,
    nonce : UInt64,
    poc_version : UInt8,
    plot_buffer : UInt8*,
    plot_buffer_offset : UIntPtrT
  ) : Void
  fun create_plots(
    account_id : UInt64,
    start_nonce : UInt64,
    nonce_count : UInt64,
    poc_version : UInt8,
    plot_buffer : UInt8*,
    plot_buffer_offset : UIntPtrT
  ) : Void
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

  fun curve25519_verify(
    public_key : UInt8*,
    signature : UInt8*,
    message_sha256 : UInt8*,
    enforce_canonical : UInt8
  ) : UInt8

  fun libshabal_version : UInt8*

  fun shabal256_destroy(shabal : Void*) : Void
  fun shabal256_digest(shabal : Void*, buffer : UInt8*, offset : UIntPtrT) : Void
  fun shabal256_new : Void*
  fun shabal256_reset(shabal : Void*) : Void
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
