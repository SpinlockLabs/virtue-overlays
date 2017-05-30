# Copyright 2014 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

DESCRIPTION="Virtue Chromium OS Addons"
HOMEPAGE="https://virtue.fork.run"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="${RDEPEND}
  app-editors/nano
  sys-process/htop
  sys-process/lsof
"
