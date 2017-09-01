require 'package'

class Openblas < Package
  description "OpenBLAS is an optimized BLAS library based on GotoBLAS2 1.13 BSD version"
  homepage "http://www.openblas.net/"
  version "0.2.20"
  source_url "https://github.com/xianyi/OpenBLAS/archive/v0.2.20.tar.gz"
  source_sha256 "5ef38b15d9c652985774869efd548b8e3e972e1e99475c673b25537ed7bcf394"
  
  depends_on 'gcc' => :build
  depends_on 'perl'
  
  def self.build
    system "make"
  end
  
  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
    system "mkdir #{CREW_DEST_DIR}/usr"
    system "mkdir #{CREW_DEST_DIR}/usr/local"
    system "mv #{CREW_DEST_DIR}/opt #{CREW_DEST_DIR}/usr/local/"
  end
end
