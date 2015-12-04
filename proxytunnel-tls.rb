class ProxytunnelTls < Formula
  desc "Create TCP tunnels through HTTPS proxies - now supporting tls"
  homepage "http://proxytunnel.sourceforge.net/"
  url "https://github.com/adamcrews/proxytunnel-tls/archive/1.9.2-tls.tar.gz"
  version "tls"
  sha256 "c9a32df74368a8a2c81cbb7b27c5fec1180cc8ef5e8c9cc7758e2c537e6101ca"

  depends_on "openssl"

  # Remove conflicting strlcpy/strlcat declarations
  patch :DATA

  def install
    system "make"
    bin.install "proxytunnel"
    man1.install "proxytunnel.1"
  end
end

__END__
[1mdiff --git a/Makefile b/Makefile[m
[1mindex 8d1300c..2e48b6d 100644[m
[1m--- a/Makefile[m
[1m+++ b/Makefile[m
[36m@@ -63,8 +63,6 @@[m [mmandir = $(datadir)/man[m
 # Remove strlcpy/strlcat on (open)bsd/darwin systems[m
 OBJ = proxytunnel.o	\[m
 	base64.o	\[m
[31m-	strlcpy.o	\[m
[31m-	strlcat.o	\[m
 	strzcat.o	\[m
 	setproctitle.o	\[m
 	io.o		\[m
[1mdiff --git a/proxytunnel.h b/proxytunnel.h[m
[1mindex b948be0..e63c72a 100644[m
[1m--- a/proxytunnel.h[m
[1m+++ b/proxytunnel.h[m
[36m@@ -32,8 +32,6 @@[m [mvoid closeall();[m
 void do_daemon();[m
 void initsetproctitle(int argc, char *argv[]);[m
 void setproctitle(const char *fmt, ...);[m
[31m-size_t strlcat(char *dst, const char *src, size_t siz);[m
[31m-size_t strlcpy(char *dst, const char *src, size_t siz);[m
 size_t strzcat(char *dst, char *format, ...);[m
 int main( int argc, char *argv[] );[m
 char * readpassphrase(const char *, char *, size_t, int);[m
