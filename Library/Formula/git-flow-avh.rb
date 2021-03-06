require 'formula'

class GitFlowAvhCompletion < Formula
  homepage 'https://github.com/petervanderdoes/git-flow-completion'
  url 'https://github.com/petervanderdoes/git-flow-completion/archive/0.4.2.tar.gz'
  sha1 '5e311225fccc22e22c7f00abf8989c853bd2b48b'

  head 'https://github.com/petervanderdoes/git-flow-completion.git', :branch => 'develop'
end

class GitFlowAvh < Formula
  homepage 'https://github.com/petervanderdoes/gitflow'
  url 'https://github.com/petervanderdoes/gitflow/archive/1.6.1.tar.gz'
  sha1 '15c76911026fa648356d24bf53a1875ebb729857'

  head 'https://github.com/petervanderdoes/gitflow.git', :branch => 'develop'

  depends_on 'gnu-getopt'

  conflicts_with 'git-flow'

  def install
    system "make", "prefix=#{prefix}", "install"

    GitFlowAvhCompletion.new('git-flow-avh-completion').brew do
      bash_completion.install "git-flow-completion.bash"
      zsh_completion.install "git-flow-completion.zsh"
    end
  end

  def caveats; <<-EOS.undent
    Create a ~/.gitflow_export file with the content
      export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"
     EOS
  end

  test do
    system "#{bin}/git-flow", "version"
  end
end
