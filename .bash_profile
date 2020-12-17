alias l="ls -lah"
alias cls=clear

if [ -d ~/enterprise2 ]; then
  alias src="cd ~/enterprise2"
  alias sshc="src; chroot-ssh.sh"
  alias gap="src; git add . && git commit --amend --no-edit && git push --force"
  alias r="src; chroot-stop.sh; chroot-reset.sh; chroot-cluster-stop.sh; chroot-cluster-reset.sh test/cluster.conf; chroot-cluster-reset.sh test/cluster-ha.conf; chroot-cluster-reset.sh test/cluster-dr.conf"
  alias b="src; r; chroot-build.sh && chroot-start.sh && chroot-configure.sh"
  alias bc="src; r; chroot-build.sh && chroot-cluster-start.sh test/cluster.conf"


  # enterprise2
  export PATH=~/enterprise2:$PATH
  export FETCH_DOCKER_IMAGES=1
  export OVERLAY_VM_FILES=yes

  src;
elif [ -d ~/ghpi-image ]; then
  
  alias src="cd ~/ghpi-image"
  
  src
fi
