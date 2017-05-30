#!/usr/bin/env bash
VIRTUE_BOARDS=(
  virtue-amd64-generic
)

function workaround_cros_board_eclass() {
  file="/mnt/host/source/src/third_party/chromiumos-overlay/eclass/cros-board.eclass"
  if ! grep -q "virtue" $file
  then
    echo "CROS_BOARDS+=(${VIRTUE_BOARDS[@]})" >> ${file}
  fi
}

workaround_cros_board_eclass
