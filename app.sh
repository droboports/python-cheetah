### CHEETAH ###
_build_cheetah() {
local VERSION="2.4.4"
local FOLDER="Cheetah-${VERSION}"
local FILE="${FOLDER}.tar.gz"
local URL="https://pypi.python.org/packages/source/C/Cheetah/${FILE}"
local XPYTHON=~/xtools/python2/${DROBO}

_download_tgz "${FILE}" "${URL}" "${FOLDER}"
pushd "target/${FOLDER}"
_PYTHON_HOST_PLATFORM="linux-armv7l" LDSHARED="${CC} -shared -Wl,-rpath,/mnt/DroboFS/Share/DroboApps/python2/lib -L${DEST}/lib-5n" "${XPYTHON}/bin/python" setup.py build_ext --force build --force bdist_egg --dist-dir ../..
popd
}

### BUILD ###
_build() {
  _build_cheetah
}

_clean() {
  rm -v -fr *.egg
  rm -vfr "${DEPS}"
  rm -vfr "${DEST}"
  rm -v -fr target/*
}
