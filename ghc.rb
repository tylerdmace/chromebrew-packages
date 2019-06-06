require 'package'

class Ghc < Package
  description 'The Glasgow Haskell Compiler is a state-of-the-art, open source compiler and interactive environment for the functional language Haskell.'
  homepage 'https://www.haskell.org/ghc/'
  version '8.4.2'
  source_url 'https://downloads.haskell.org/~ghc/8.4.2/ghc-8.4.2-src.tar.xz'
  source_sha256 '01cc32f24a06bf3b2428351b6d7fec791e82d042426d29ad9e5a245b35f0047b'

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'stack'
  depends_on 'libtinfo'

  def self.build
    system "stack setup ghc-8.4.2"
    system "echo '#!/bin/bash' > ghc"
    system "echo 'stack ghc \"\$@\"' >> ghc"
  end

  def self.install
    system "install -Dm755 ghc #{CREW_DEST_PREFIX}/bin/ghc"
  end
end
