
# Load all additional bashrc files we have for this package.
rectitude_stack_bashrc() {
        local cfgd

        cfgd="/mnt/host/source/src/private-overlays/overlay-rectitude/${CATEGORY}/${PN}"
        for cfg in ${PN} ${P} ${PF} ; do
                cfg="${cfgd}/${cfg}.bashrc"
                [[ -f ${cfg} ]] && . "${cfg}"
        done
}
rectitude_stack_bashrc

