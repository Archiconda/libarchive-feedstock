#!/bin/bash

autoreconf -vfi
mkdir build-${HOST} && pushd build-${HOST}
${SRC_DIR}/configure --prefix=${PREFIX}  \
                     --with-zlib         \
                     --with-bz2lib       \
                     --with-iconv        \
                     --with-lz4          \
                     --with-lzma         \
                     --with-lzo2         \
                     --with-zstd         \
                     --without-cng       \
                     --with-openssl      \
                     --without-nettle    \
                     --with-xml2         \
                     --without-expat
                     # --enable-static=no
		     # --enable-bsdtar=shared
                     # --enable-bsdcat=shared
                     # --enable-bsdcpio=shared
make -j${CPU_COUNT} ${VERBOSE_AT}
make install
popd
