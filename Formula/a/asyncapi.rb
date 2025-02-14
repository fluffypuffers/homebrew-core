class Asyncapi < Formula
  desc "All in one CLI for all AsyncAPI tools"
  homepage "https://github.com/asyncapi/cli"
  url "https://registry.npmjs.org/@asyncapi/cli/-/cli-2.16.2.tgz"
  sha256 "f9a016d4874e846d7273b6c3ce7f794f3b1eaeca8b09ae0b70945a98a21c8feb"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "497d70ae8b6f5141c3ded08dbcbdc8941c5699193f4ddea8c27becc77ed777f2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "497d70ae8b6f5141c3ded08dbcbdc8941c5699193f4ddea8c27becc77ed777f2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "497d70ae8b6f5141c3ded08dbcbdc8941c5699193f4ddea8c27becc77ed777f2"
    sha256 cellar: :any_skip_relocation, sonoma:        "9fdf6689d6c5fa01e79c6315bd867d181fa95e15a1ae2292b56a7b525f83ed83"
    sha256 cellar: :any_skip_relocation, ventura:       "9fdf6689d6c5fa01e79c6315bd867d181fa95e15a1ae2292b56a7b525f83ed83"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "497d70ae8b6f5141c3ded08dbcbdc8941c5699193f4ddea8c27becc77ed777f2"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"asyncapi", "new", "file", "--file-name=asyncapi.yml", "--example=default-example.yaml", "--no-tty"
    assert_predicate testpath/"asyncapi.yml", :exist?, "AsyncAPI file was not created"
  end
end
