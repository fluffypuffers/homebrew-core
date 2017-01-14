class Joe < Formula
  desc "Joe's Own Editor (JOE)"
  homepage "http://joe-editor.sourceforge.net/index.html"
  url "https://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-4.3/joe-4.3.tar.gz"
  sha256 "985d6a8f943a06e64165996c24d7fecaeae8c59efb52998a49b3fb4b8a3e26e1"

  bottle do
    sha256 "651f4fb35e25b81b27b64b517f01df63ea05d5079fc702f329b05aa641bbb97e" => :sierra
    sha256 "3404c9b3378b430dbbf416a3e29cc15b29aacdca1d00ff9d05982d711f741967" => :el_capitan
    sha256 "4cf7df6c52a64dcd917e6d39aca024b57ff0313bb07ee79ff3f6e7ebad037735" => :yosemite
    sha256 "ecfa1240b7102d12171acbd2f5f3fdc4723e4b657495ec7c81e9c5b0f6d45ec1" => :mavericks
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match "Joe's Own Editor v#{version}", shell_output("TERM=tty #{bin}/joe -help")
  end
end
