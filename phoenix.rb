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
  head 'https://github.com/phoenixframework/phoenix.git'

  depends_on MixInstalled

  def install
    system 'mix', 'deps.get,', 'compile'
  end
end
