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
diff --git a/Makefile b/Makefile
index 8d1300c..77f2819 100644
--- a/Makefile
+++ b/Makefile
@@ -64,8 +64,6 @@ mandir = $(datadir)/man
 OBJ = proxytunnel.o    \
        base64.o        \
        strlcpy.o       \
-       strlcat.o       \
-       strzcat.o       \
        setproctitle.o  \
        io.o            \
        http.o          \
diff --git a/proxytunnel.h b/proxytunnel.h
index b948be0..e63c72a 100644
--- a/proxytunnel.h
+++ b/proxytunnel.h
@@ -32,8 +32,6 @@ void closeall();
 void do_daemon();
 void initsetproctitle(int argc, char *argv[]);
 void setproctitle(const char *fmt, ...);
-size_t strlcat(char *dst, const char *src, size_t siz);
-size_t strlcpy(char *dst, const char *src, size_t siz);
 size_t strzcat(char *dst, char *format, ...);
 int main( int argc, char *argv[] );
 char * readpassphrase(const char *, char *, size_t, int);
