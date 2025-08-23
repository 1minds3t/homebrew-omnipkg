# In homebrew-omnipkg/omnipkg.rb

class Omnipkg < Formula
  include Language::Python::Virtualenv

  desc "The Ultimate Python Dependency Resolver"
  homepage "https://github.com/1minds3t/omnipkg"
  url "https://pypi.io/packages/source/o/omnipkg/omnipkg-1.0.17.tar.gz"
  sha256 "29dd153d522a02c28d50afa7346547f8cbc01aa709b426b082a003710566af04"
  license "AGPL-3.0-only"

  # == Dependencies ==
  # These are the system-level tools Homebrew will install.
  # This is a huge win, as it will install the Redis SERVER for the user!
  depends_on "python@3.10"
  depends_on "redis"
  depends_on "libmagic" # The library for `python-magic`

  # == Python Library Dependencies ==
  # These are installed into an isolated environment for omnipkg.
  # Latest stable versions and SHA256 hashes from PyPI (as of August 23, 2025).
  
  resource "aiohappyeyeballs" do
    url "https://pypi.io/packages/source/a/aiohappyeyeballs/aiohappyeyeballs-2.6.1.tar.gz"
    sha256 "c3f9d0113123803ccadfdf3f0faa505bc78e6a72d1cc4806cbd719826e943558"
  end

  resource "aiohttp" do
    url "https://pypi.io/packages/source/a/aiohttp/aiohttp-3.12.15.tar.gz"
    sha256 "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
  end

  resource "aiosignal" do
    url "https://pypi.io/packages/source/a/aiosignal/aiosignal-1.4.0.tar.gz"
    sha256 "f47eecd9468083c2029cc99945502cb7708b082c232f9aca65da147157b251c7"
  end

  resource "attrs" do
    url "https://pypi.io/packages/source/a/attrs/attrs-25.3.0.tar.gz"
    sha256 "75d7cefc7fb576747b2c81b4442d4d4a1ce0900973527c011d1030fd3bf4af1b"
  end

  resource "certifi" do
    url "https://pypi.io/packages/source/c/certifi/certifi-2025.8.3.tar.gz"
    sha256 "e564105f78ded564e3ae7c923924435e1daa7463faeab5bb932bc53ffae63407"
  end

  resource "charset-normalizer" do
    url "https://pypi.io/packages/source/c/charset_normalizer/charset_normalizer-3.4.3.tar.gz"
    sha256 "6fce4b8500244f6fcb71465d4a4930d132ba9ab8e71a7859e6a5d59851068d14"
  end

  resource "filelock" do
    url "https://pypi.io/packages/source/f/filelock/filelock-3.19.1.tar.gz"
    sha256 "66eda1888b0171c998b35be2bcc0f6d75c388a7ce20c3f3f37aa8e96c2dddf58"
  end

  resource "frozenlist" do
    url "https://pypi.io/packages/source/f/frozenlist/frozenlist-1.7.0.tar.gz"
    sha256 "2e310d81923c2437ea8670467121cc3e9b0f76d3043cc1d2331d56c7fb7a3a8f"
  end

  resource "idna" do
    url "https://pypi.io/packages/source/i/idna/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "multidict" do
    url "https://pypi.io/packages/source/m/multidict/multidict-6.6.4.tar.gz"
    sha256 "d2d4e4787672911b48350df02ed3fa3fffdc2f2e8ca06dd6afdf34189b76a9dd"
  end

  resource "packaging" do
    url "https://pypi.io/packages/source/p/packaging/packaging-25.0.tar.gz"
    sha256 "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
  end

  resource "propcache" do
    url "https://pypi.io/packages/source/p/propcache/propcache-0.3.2.tar.gz"
    sha256 "20d7d62e4e7ef05f221e0db2856b979540686342e7dd9973b815599c7057e168"
  end

  resource "python-magic" do
    url "https://pypi.io/packages/source/p/python-magic/python-magic-0.4.27.tar.gz"
    sha256 "c1ba14b08e4a5f5c31a302b7721239695b2f0f058d125bd5ce1ee36b9d9d3c3b"
  end

  resource "redis" do
    url "https://pypi.io/packages/source/r/redis/redis-6.4.0.tar.gz"
    sha256 "b01bc7282b8444e28ec36b261df5375183bb47a07eb9c603f284e89cbc5ef010"
  end

  resource "requests" do
    url "https://pypi.io/packages/source/r/requests/requests-2.32.5.tar.gz"
    sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
  end

  resource "tqdm" do
    url "https://pypi.io/packages/source/t/tqdm/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  resource "typing-extensions" do
    url "https://pypi.io/packages/source/t/typing-extensions/typing-extensions-4.14.1.tar.gz"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  end

  resource "urllib3" do
    url "https://pypi.io/packages/source/u/urllib3/urllib3-2.5.0.tar.gz"
    sha256 "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
  end

  resource "yarl" do
    url "https://pypi.io/packages/source/y/yarl/yarl-1.20.1.tar.gz"
    sha256 "d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac"
  end

  def install
    # This is the magic: it creates a dedicated virtual environment for omnipkg,
    # installs all the Python dependencies from the 'resource' blocks,
    # and then installs omnipkg itself.
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    venv.pip_install_and_link buildpath
  end

  test do
    # This test runs after installation to verify it works.
    assert_match "omnipkg #{version}", shell_output("#{bin}/omnipkg --version")
    # A simple command to ensure it can execute
    assert_match "Available commands:", shell_output("#{bin}/omnipkg --help")
  end
end