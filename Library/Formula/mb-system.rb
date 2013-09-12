require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MbSystem < Formula
  homepage 'http://www.ldeo.columbia.edu/res/pi/MB-System/'
  url 'ftp://ftp.ldeo.columbia.edu/pub/MB-System/mbsystem-5.4.2135.tar.gz'
  sha1 'ea25543df5fcc69477802eb6f7b63646dfb068f8'

  # depends_on 'cmake' => :build
  depends_on 'gmt'    # Fink had gmt-dev
  depends_on 'netcdf' # Fink had netcdf-shlibs
  depends_on 'proj'
  depends_on 'fftw'   # Fink had fftw3
  depends_on :x11     # Fink had x11-dev

  conflicts_with 'lesstif', :because => 'Not sure why, this conflict is a carry over from the Fink installation'

  # FROM FINK DIRECTIONS
  # BuildDepends: gmt-dev, openmotif4, netcdf, x11-dev, proj, fftw3
  # BuildConflicts: lesstif, openmotif3
  # Depends: gmt, openmotif4-shlibs, netcdf-shlibs, x11, gv, proj-bin, proj-shlibs

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test mbsystem`.
    system "false"
  end
end
