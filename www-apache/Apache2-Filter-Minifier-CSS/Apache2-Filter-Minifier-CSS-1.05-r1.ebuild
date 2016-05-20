# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.16.6

EAPI=5

MODULE_AUTHOR="GTERMARS"
MODULE_VERSION="1.05"
inherit perl-module

DESCRIPTION="CSS minifying output filter"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-perl/CSS-Minifier
	dev-perl/CSS-Minifier-XS
	dev-lang/perl
	>=www-apache/mod_perl-2.0.8"
DEPEND="${RDEPEND}
	dev-perl/Module-Build
	>=dev-perl/Apache-Test-1.38"

