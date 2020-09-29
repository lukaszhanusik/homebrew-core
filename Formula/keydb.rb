class Keydb < Formula
  desc "Multithreaded fork of Redis"
  homepage "https://keydb.dev"
  url "https://github.com/JohnSully/KeyDB/archive/v6.0.16.tar.gz"
  sha256 "809369321d1a98a57337447cce0fd84197dd3c9b493ec1ea2e29268d8534ee5d"
  license "BSD-3-Clause"

  bottle do
    cellar :any_skip_relocation
    sha256 "e718d2be36d52596f2ad33e0d6bcd063173de0e3b2825a89ef0420e141ac2198" => :catalina
    sha256 "f063c6ea799a16c0f10611483c299b81595f38e5225a4cf393b096f6e41ab0e1" => :mojave
    sha256 "c528879a051d37d3734f178cf16610e74172bef322c9aac98c77a1fb2b42993d" => :high_sierra
  end

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    output = shell_output("#{bin}/keydb-server --test-memory 2")
    assert_match "Your memory passed this test", output
  end
end
