class ProxytunnelTls < Formula
  desc "Create TCP tunnels through HTTPS proxies - now supporting tls"
  homepage "http://proxytunnel.sourceforge.net/"
  url "https://github.com/adamcrews/proxytunnel-tls/archive/1.9.2-2.tar.gz"
  version "2"
  sha256 "ad4846ef894669482dd297ffc1f3605c356a8bcb6c80333fc75bf9a97ffb004b"

  depends_on "openssl"
  depends_on "asciidoc"
  depends_on "xmlto"

  def install
    system "make"
    bin.install "proxytunnel"
    man1.install "proxytunnel.1"
  end
end

__END__
