alias l="ls -lah"
alias cls=clear

#kubectl stuff
alias k=kubectl
alias kd="kubectl describe"
alias kdp="kubectl describe pod"
alias kl="kubectl logs"
alias kp="kubectl get pods"
alias a="script/apply"
alias dr="k delete -R -f rendered"
alias dpvc="k delete pvc --all"
alias dpv="k delete pv --all"
alias ddb="az mysql db delete -g $DEV_USER -s $DEV_USER -n github_enterprise -y"
alias sa="script/setup --no-provision --deploy -R"
alias sav="script/setup --no-provision --deploy -v -R"
alias sp="script/setup --provision --deploy -R"
alias spv="script/setup --provision --deploy -R -v"

#make ruby work
eval "$(rbenv init -)"
ruby -v

function pristine(){
  ./script/ensure-azure-login
  name=$(find_available_name)
  num=${name#tquinn}
  old_num=$((num-1))
  old_name="tquinn$old_num"
  mark_for_deletion "$old_name"
  # cd ~/code/ghae-kube
  ./script/setup -g "$name" -v "$@"
}

function mark_for_deletion() {
  group_name="$1"
  echo "Marking resource group $group_name for deletion."
  az tag update --resource-id "$group_name" --operation merge --tags "auto_cleanup_date_utc=01/01/21@00:00:00" || true
}

function mark_all_for_deletion() {
  subscription=${1:-"GHAE Dev 4"}
  for i in $(az group list --subscription "$subscription" --query "[?tags.owner=='tquinn86'].id" -otsv); do
    echo $i
    mark_for_deletion $i
   done
}

function find_available_name() {
  arr=($(az group list --query '[].name' -otsv | grep '^tquinn' | grep -v '\-nrg\|\-runner' | sort));
  # should always have tquinn0 in it at least, but in case...
  if [[ "$arr" == "" ]]; then
    echo "tquinn1"
  else
    last=${arr[-1]}
    num=${last#tquinn}
    num=$((num+1))
    echo "tquinn$num"
  fi
}
