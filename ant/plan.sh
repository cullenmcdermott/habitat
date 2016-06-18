pkg_origin=cullenmcdermott
pkg_name=ant
pkg_version=1.9.7
pkg_maintainer="Cullen McDermott <cullen@cullenmcdermott.com>"
pkg_license=(GPL)
pkg_source=https://github.com/apache/ant/archive/rel/$pkg_version.tar.gz
pkg_shasum=53dbfb13e0e9bf1b34bcbfdf807c1b9df1b89362b176e1e58150906f518b2c88
pkg_deps=(core/findutils)
pkg_build_deps=(core/jdk8)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
do_build() {
  export JAVA_HOME=$(hab pkg path core/jdk8)
  ln -s $(hab pkg path core/glibc)/lib/ld-2.22.so /lib/ld-linux-x86-64.so.2
  pushd $HAB_CACHE_SRC_PATH/$pkg_name-rel-$pkg_version
  sh ./build.sh -Ddist.dir=$pkg_prefix dist
  echo $JAVA_HOME
}

do_install() {
  return 0
}

do_test() {
  export JAVA_HOME=$(hab pkg path core/jdk8)
  ant --diagnostics
}
