# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Apache2-AuthenNTLM/Apache2-AuthenNTLM-0.20.0.ebuild,v 1.2 2011/09/03 21:05:18 tove Exp $

EAPI=5

MODULE_AUTHOR="GTERMARS"
MODULE_VERSION=1.05
inherit perl-module

DESCRIPTION="Apache2::Filter::Minifier::JavaScript - JS minifying output filter"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-perl/JavaScript-Minifier-XS
	dev-perl/JavaScript-Minifier
	perl-core/Time-HiRes
	>=www-apache/mod_perl-2"
DEPEND="${RDEPEND}
	dev-perl/Apache-Test
	virtual/perl-Module-Build"

