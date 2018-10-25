# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Tray application and Dolphin/Plasma integration for Syncthing"
HOMEPAGE="https://github.com/Martchus/syncthingtray"
SRC_URI="https://github.com/Martchus/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore
	dev-qt/qtnetwork
	dev-qt/qtdbus
	dev-qt/qtgui
	dev-qt/qtwidgets
	dev-qt/qtsvg
  dev-util/cpp-utilities
  dev-util/qtutilities
"
DEPEND="${RDEPEND}"


src_configure() {
	local mycmakeargs=(
    -DSYSTEMD_SUPPORT=ON
		-DCMAKE_BUILD_TYPE=Release
	)

	cmake-utils_src_configure
}