class Cyclone < Formula
  desc ":cyclone: A brand-new compiler that allows practical application development using R7RS Scheme."
  homepage "http://justinethier.github.io/cyclone/"
  #url "https://github.com/justinethier/cyclone/archive/v0.10.tar.gz"
  url "https://github.com/adamfeuer/cyclone/archive/v0.10.1-test-af1.tar.gz"
  sha256 "8112f249e007bb10475854ac445faa1e41c1dfda7bb0e4c1a70a26c82e7f60fe"
  version "0.10.1-test-af1"
  depends_on "git"
  depends_on "gcc"
  depends_on "libtommath"
  depends_on "ck"
  #depends_on "cyclone-bootstrap"
  depends_on :xcode 

  def install_cyclone_files
    bin.install_symlink libexec/"cyclone"
    bin.install_symlink libexec/"icyc"
    lib.install_symlink libexec/"libcyclone.a"
    mkdir include/"cyclone"
    (include/"cyclone").install_symlink Dir["#{libexec}/include/cyclone/*.h"]
    mkdir_p share/"cyclone/scheme"
    (share/"cyclone/scheme").install_symlink Dir["#{libexec}/scheme/*.sld"]
    (share/"cyclone/scheme").install_symlink Dir["#{libexec}/scheme/*.o"]
	(share/"cyclone/scheme").install_symlink Dir["#{libexec}/scheme/*.so"]
    (share/"cyclone/scheme").install_symlink Dir["#{libexec}/scheme/cyclone/*.sld"]
    (share/"cyclone/scheme").install_symlink Dir["#{libexec}/scheme/cyclone/*.scm"]
    (share/"cyclone/scheme").install_symlink Dir["#{libexec}/scheme/cyclone/test.meta"]
    (share/"cyclone/scheme").install_symlink Dir["#{libexec}/scheme/cyclone/match.meta"]
    (share/"cyclone/scheme").install_symlink Dir["#{libexec}/scheme/cyclone/array-list.meta"]
    (share/"cyclone/scheme/cyclone").install_symlink Dir["#{libexec}/scheme/cyclone/*.o"]
    (share/"cyclone/scheme/cyclone").install_symlink Dir["#{libexec}/scheme/cyclone/*.so"]
    mkdir_p share/"cyclone/srfi"
    (share/"cyclone/srfi").install_symlink Dir["#{libexec}/srfi/*.sld"]
    (share/"cyclone/srfi").install_symlink Dir["#{libexec}/srfi/*.scm"]
    mkdir_p share/"cyclone/srfi/list-queues"
    (share/"cyclone/srfi/list-queues").install_symlink Dir["#{libexec}/srfi/list-queues/*.scm"]
    mkdir_p share/"cyclone/srfi/sorting"
    (share/"cyclone/srfi/sorting").install_symlink Dir["#{libexec}/srfi/sorting/*.scm"]
    mkdir_p share/"cyclone/srfi/sets"
    (share/"cyclone/srfi/sets").install_symlink Dir["#{libexec}/srfi/sets/*.scm"]
    (share/"cyclone/srfi").install_symlink Dir["#{libexec}/srfi/*.meta"]
    (share/"cyclone/srfi").install_symlink Dir["#{libexec}/srfi/*.o"]
    (share/"cyclone/srfi").install_symlink Dir["#{libexec}/srfi/*.so"]
  end     

  def install
    ENV.deparallelize
    system "make"
    install_cyclone_files
  end

  test do
      system "make test"
  end
end
