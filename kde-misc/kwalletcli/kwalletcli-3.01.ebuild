# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="A command-line interface for the KDE Wallet"
HOMEPAGE="https://www.mirbsd.org/kwalletcli.htm"
SRC_URI="https://www.mirbsd.org/MirOS/dist/hosted/${PN}/${P}.tar.gz"

LICENSE="MirOS"
SLOT="5"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-eselect/eselect-pinentry
         app-shells/mksh
         dev-qt/qtcore:5
         dev-qt/qtgui:5
         dev-qt/qtwidgets:5
         kde-frameworks/ki18n:5
         kde-frameworks/ki18n:5
         kde-frameworks/kwallet:5"
DEPEND="${RDEPEND}
         virtual/pkgconfig"

S="${WORKDIR}/${PN}"

src_prepare() {
# 	sed -i -e "s:-lQtCore:$($(tc-getPKG_CONFIG) --libs QtCore):" GNUmakefile || \
# 		die 'sed on GNUmakefile failed'
	sed -i -r 's!^(C(XX|PP)?FLAGS[?+]?=.*)!\1 -fPIC!g' GNUmakefile
	einfo "Skipping"
}

src_compile() {
	#tc-export CC CXX
	emake KDE_VER=5
}

src_install() {
	# Workaround for broken install script
	dodir /usr/bin /usr/share/man/man1

	emake DESTDIR="${D}" INSTALL_STRIP= install
}
