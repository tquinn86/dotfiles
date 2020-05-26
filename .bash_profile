alias l="ls -lah"
alias cls=clear
alias src="cd ~/enterprise2"
alias sshc="src; chroot-ssh.sh"
alias gap="src; git add . && git commit --amend --no-edit && git push --force"
alias r="src; chroot-stop.sh; chroot-reset.sh; chroot-cluster-stop.sh; chroot-cluster-reset.sh test/cluster.conf; chroot-cluster-reset.sh test/cluster-ha.conf; chroot-cluster-reset.sh test/cluster-dr.conf"
alias b="src; r; chroot-build.sh && chroot-start.sh && chroot-configure.sh"
alias bc="src; r; chroot-build.sh && chroot-cluster-start.sh test/cluster.conf"

# enterprise2
export PATH=~/enterprise2:$PATH
export DEV_MODE=1
export GHE_LXC_NAME=ghe-dev-$(id -un)
export FETCH_DOCKER_IMAGES=1
export OVERLAY_VM_FILES=yes

src;
