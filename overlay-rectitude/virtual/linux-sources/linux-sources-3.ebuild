# Copyright 2015 Google Inc. All rights reserved.

# This overrides the virtual/linux-sources package in chromiumos-overlay to
# include the custom Rectitude kernel.

EAPI="5"

DESCRIPTION="Rectitude Kernel virtual package"
HOMEPAGE="http://src.chromium.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

IUSE_KERNEL_VERS=(
	kernel-4_4
)
IUSE="kernel_sources ${IUSE_KERNEL_VERS[*]}"
REQUIRED_USE="?? ( ${IUSE_KERNEL_VERS[*]} )"

# We have to make sure to unmerge any previous chromiumos kernel.
RDEPEND="
	!sys-kernel/chromeos-kernel
	!sys-kernel/rectitude-kernel
	!sys-kernel/upstream-kernel-mainline
	!sys-kernel/upstream-kernel-next
	kernel-4_4? ( sys-kernel/rectitude-kernel-4_4[kernel_sources=] )
"

# Add blockers so when migrating between USE flags, the old version gets
# unmerged automatically.
RDEPEND+="
	$(for v in "${IUSE_KERNEL_VERS[@]}"; do echo "!${v}? ( !sys-kernel/rectitude-${v} )"; done)
"

# Default to the 4.4 kernel if none has been selected.
RDEPEND_DEFAULT="sys-kernel/rectitude-kernel-4_4"
# Here be dragons!
RDEPEND+="
	$(printf '!%s? ( ' "${IUSE_KERNEL_VERS[@]}")
	${RDEPEND_DEFAULT}
	$(printf '%0.s) ' "${IUSE_KERNEL_VERS[@]}")
"
