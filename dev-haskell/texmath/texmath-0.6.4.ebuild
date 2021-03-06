# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.3.3.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Conversion of LaTeX math formulas to MathML or OMML"
HOMEPAGE="https://github.com/jgm/texmath"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="cgi test"
RESTRICT="!test? ( test )"

RDEPEND="dev-haskell/pandoc-types:=[profile?]
	>=dev-haskell/parsec-3:=[profile?]
	dev-haskell/syb:=[profile?]
	dev-haskell/xml:=[profile?]
	>=dev-lang/ghc-6.10.4:=
	cgi? ( dev-haskell/cgi:=[profile?]
		dev-haskell/json:=[profile?]
		dev-haskell/utf8-string:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0.3
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag cgi cgi) \
		$(cabal_flag test test)
}

src_install() {
	cabal_src_install

	# remove test and it's data
	rm -f  "${ED}/usr/bin/texmath" 2> /dev/null
	rm -rf "${ED}/usr/share/${P}"/ghc-*/tests 2> /dev/null
}
