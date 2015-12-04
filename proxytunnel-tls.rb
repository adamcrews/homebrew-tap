class ProxytunnelTls < Formula
  desc "Create TCP tunnels through HTTPS proxies - now supporting tls"
  homepage "http://proxytunnel.sourceforge.net/"
  url "https://github.com/adamcrews/proxytunnel-tls/archive/1.9.2-1.tar.gz"
  version "1"
  sha256 "a8ed7f463d5adb17fa1dcd26b2142a3d2b356c4c0b61f0417597976c7feb35a5"

  depends_on "openssl"
  depends_on "asciidoc"
  depends_on "xmlto"
  depends_on "docbook-xsl"

  def install
    system "make"
    bin.install "proxytunnel"
    man1.install "proxytunnel.1"
  end
end

__END__
