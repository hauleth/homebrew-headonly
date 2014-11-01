require 'formula'

class MixInstalled < Requirement
  satisfy { which 'mix' }

  def message; <<-EOS.undent
    You need to install Mix to use this software.

    Installation is described here:
      https://hex.pm/docs/usage
    EOS
  end
end

class Phoenix < Formula
  homepage 'https://github.com/phoenixframework/phoenix'
  head 'https://github.com/phoenixframework/phoenix.git', :tag => 'v0.5.0'

  depends_on MixInstalled

  def install
    system 'mix', 'do', 'deps.get,', 'archive.build,', 'archive.install', '--force'

    system 'mkdir', '-p', '~/.mix/archive/'
    system 'cp', '-r', 'priv/', '~/.mix/archive/phoenix-0.5.0/'
  end
end
