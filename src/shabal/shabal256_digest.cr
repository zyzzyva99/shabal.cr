require "digest/base"

class Shabal::Shabal256Digest < Digest::Base
  def initialize
    @shabal256_instance = Shabal::LibShabal.shabal256_new
    reset
  end

  def finalize
    Shabal::LibShabal.shabal256_destroy(@shabal256_instance)
  end

  private def digest_size : Int32
    32
  end

  private def reset_impl : Nil
    Shabal::LibShabal.shabal256_reset(@shabal256_instance)
  end

  private def update_impl(data : Bytes) : Nil
    Shabal::LibShabal.shabal256_update(
      @shabal256_instance,
      data.to_unsafe,
      0,
      data.bytesize
    )
  end

  private def final_impl(dst : Bytes) : Nil
    Shabal::LibShabal.shabal256_digest(@shabal256_instance, dst.to_unsafe, 0)
  end
end
