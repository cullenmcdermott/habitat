pkg_origin=cullenmcdermott
pkg_name=cassandra
pkg_version=3.7
pkg_maintainer="Cullen McDermott <cullen@cullenmcdermott.com>"
pkg_license=(GPL)
pkg_source=https://github.com/apache/$pkg_name/archive/$pkg_name-$pkg_version.tar.gz
pkg_shasum=68cf74d07cbe67c8eb860d74c9a46434b2687933b817506fe9c843a9b379f272
pkg_deps=()
pkg_build_deps=(core/jdk8 core/git cullenmcdermott/ant)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
  export JAVA_HOME=$(hab pkg path core/jdk8)
  pushd $HAB_CACHE_SRC_PATH/$pkg_name-$pkg_name-$pkg_version
  ant
  ls -l $HAB_CACHE_SRC_PATH/$pkg_name-$pkg_name-$pkg_version/build
  #mv $HAB_CACHE_SRC_PATH/$pkg_name-$pkg_name-$pkg_version/build/
}

do_install() {
  return 0
}
