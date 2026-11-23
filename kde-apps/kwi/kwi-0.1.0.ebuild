# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
ECM_HANDBOOK="optional"
ECM_TEST="true"
KFMIN=6.29.0
QTMIN=6.11.2
inherit ecm gear.kde.org

DESCRIPTION="Modern and fast terminal that integrates well with KDE Plasma"
HOMEPAGE="https://apps.kde.org/en-gb/kwi/"
SRC_URI="https://invent.kde.org/utilities/kwi/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-libs/kirigami-addons-1.11
	>=dev-libs/kirigami-app-components-1.1
	>=dev-libs/libghostty-vt-1.0.1
	>=kde-frameworks/kcolorscheme-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/kguiaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kiconthemes-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/kpty-${KFMIN}:6
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-build/cmake-3.28"
S="${WORKDIR}/${PN}-v${PV}"
