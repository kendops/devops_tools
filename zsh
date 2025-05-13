# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#gem
export GEM_HOME="$HOME/.gem"

# need to disable in order for exa ls alias to work
#DISABLE_LS_COLORS="true"
#zsh-nap
# [[ -r /Users/swilliams/Desktop/lab/git/znap/znap.zsh ]] ||
#     git clone --depth 1 -- \
#         https://github.com/marlonrichert/zsh-snap.git /Users/swilliams/Desktop/lab/git/znap
source /Users/swilliams/Desktop/lab/git/znap/znap.zsh
#znap fpath _kubectl 'kubectl completion  zsh'
#znap eval zoxide 'zoxide init zsh --cmd j'

#fzf
#[ -f /.fzf.zsh ] && source /.fzf.zsh

# FZF settings
export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files -g "!.git/"'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

#colorls and gem
export PATH="$HOME/.gem/ruby/3.2.0/bin:$PATH"
alias lc='colorls -lAG --sd --gs'
# thefuck
eval $(thefuck --alias)

# aliases
alias gs="git status"
alias ls="colorls --gs --sd" 
alias rm-tf-state='fig run rm-tf-state'
alias rm-ssh='fig run ssh'
alias gitpush='fig run gitpush'
alias ls='colorls --gs'

# alias ls="exa --icons"
alias ll="exa -l -g --icons"
alias lt="exa --tree --icons -a -I '.git|_pycache_|.mypy_cache|.ipynb_checkpoints'"

alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
#kubernetes
source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1
source <(kubectl completion zsh)
[ -f /.kubectl_aliases ] && source /.kubectl_aliases
[ -f ~/.kubectl_aliases ] && source \
   <(cat ~/.kubectl_aliases | sed -r 's/(kubectl.*) --watch/watch \1/g')
function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }

#ruby
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
# Fig post block. Keep at the bottom of this file.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#completion
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect '\r' .accept-line
zstyle ':autocomplete:*' default-context history-incremental-search-backward

# autosuggest
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
  PS1='$(kube_ps1)'$PS1
# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# source <(kubeone completion bash)

PROMPT='%(?.%F{blue}√.%F{red}?%?)%f %F{red}%1~ %f%(?.%F{green}✪—➤ '
alias l='ls -lrt'
alias ll='ls -lrt '
alias la='ls -lrta --color'
alias df='df -hP'
alias su='sudo su -'
alias dir='ls -l | grep '^d''

# User specific aliases and functions
alias start-all='/mnt/c/staging/aws/ansible-aws-ec2-playbook/ec2-start-all-instances.yml'
alias stop-all='/mnt/c/staging/aws/ansible-aws-ec2-playbook/ec2-stop-all-instances.yml'
alias terminate-all='/mnt/c/staging/aws/ansible-aws-ec2-playbook/ec2-terminate-all-instances.yml'
alias list-all='/mnt/c/staging/aws/aws-scripts/list-all-instance.sh'
alias alls='/mnt/c/staging/aws/aws-scripts/list-all-instance.sh'
alias ec2='/mnt/c/staging/aws/aws-scripts/list-all-instance.sh'
alias scripts='/mnt/c/staging/aws/aws-scripts'
alias launch-1='/mnt/c/staging/aws/ansible-aws-ec2-playbook/1_ec2-provision.yml'
alias launch-more='/mnt/c/staging/aws/ansible-aws-ec2-playbook/1_ec2-deploy-multiple-instances.yml'
alias validate='terraform validate'
alias fmt='terraform fmt'
alias plan='terraform plan'
alias destroy='terraform destroy --auto-approve'
alias apply='terraform apply --auto-approve'
alias hub='cd /mnt/c/GitHub'
alias learn-ansible='/mnt/c/staging/aws/learn-ansible-aws'
alias learn-tf='/mnt/c/staging/aws/learn-terraform-aws'
alias ansible-pro='/mnt/c/staging/aws/Ansible-Project'
alias elb='/mnt/c/staging/aws/Ansible-Project/ansible-elb-playbook'
alias github='cd /mnt/c/GitHub'
alias ansible-jenkins='cd /mnt/c/GitHub/ansible-jenkins'
alias terraform-jenkins='cd /mnt/c/GitHub/terraform-jenkins'
alias dc='/mnt/c/GitHub/TERRAFORM-PROJECT-2022'
alias glab='/mnt/c/GitHub/TERRAFORM/GITLAB-HELM-PROJECT'
alias ansible-ec2='cd /mnt/c/staging/aws/Ansible-Project/ansible-ec2-playbook'
alias change='ansible-playbook --ask-vault-pass /mnt/c/staging/aws/Ansible-Project/ansible-ec2-playbook/1_ec2-change-state.yml -i /mnt/c/staging/aws/Ansible-Project/ansible-ec2-playbook/hosts'
alias devboxu='ssh -i ~/helm-test.pem ubuntu@3.16.49.47'
alias devbox8='ssh -i ~/helm-test.pem ec2-user@3.136.198.17'
alias devb='ssh ec2-user@3.146.184.86'
alias dw='ssh -i ~/helm-test.pem ec2-user@3.136.198.17'
alias ms='/Users/swilliams/scripts/ms-instance.sh'
alias init='terraform init'
alias apply='terraform apply -auto-approve'
alias destroy='terraform destroy -auto-approve'

#### Stop and Start devbox Instance ####
# aws ec2 describe-instances --filters "Name=tag:Name,Values=devbox2" "Name=instance-state-name,Values=running" --output text --query 'Reservations[*].Instances[*].InstanceId')
alias devup='aws ec2 start-instances --instance-ids i-027644aed32d7f12a'
alias devdown='aws ec2 stop-instances --instance-ids i-027644aed32d7f12a'
alias ckaup='~/aws-scripts/ckaup.sh'
alias ckadn='~/aws-scripts/ckadown.sh'
alias d0='ssh -i ~/helm-test.pem ec2-user@18.221.74.166'
alias d1='ssh -i ~/helm-test.pem ec2-user@3.16.14.152'
alias d2='ssh swilliams@172.29.0.18'
alias d3='ssh swilliams@172.29.0.17'
alias d4='ssh swilliams@172.29.0.19'
alias d5='ssh swilliams@10.1.10.6'
alias ac='source ~/env/bin/activate'
alias node='kubectl get nodes'
#source ~/env/bin/activate

### CODEBASE Build #####

alias build-config='ansible-playbook -i hosts.ini build-config-playbook.yaml -vvv'
alias build-terragrunt='ansible-playbook -i hosts.ini terragrunt-deploy-playbook.yaml -vvv'
alias destroy-terragrunt='ansible-playbook -i hosts.ini terragrunt-deploy-playbook.yaml --tags "tg-destroy"'
alias build-helm='ansible-playbook -i hosts.ini helm-build-playbook.yaml -vvv'

# if [[ -n $SSH _CONNECTION ]] ; then
#     source ~/env/bin/activate
# fi 
#
alias kconfig='kubectl config get-contexts'
alias guni='helm uninstall gitlab -n gitlab'
alias elb='kubectl --namespace ingress-nginx  get services -o wide -w nginx-ingress-ingress-nginx-controller'
alias ks='kubectl get services'
alias gw='kubectl get pods --namespace=gitlab --watch'
alias hil='helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace'
alias kll='kubectl -n longhorn-system get pod'
alias hdl='helm uninstall longhorn --namespace longhorn-system'
alias wl='helm search repo longhorn'
alias k='kubectl'
alias kgp='kubectl describe po'
alias kns='kubectl get ns'
alias kpl='kubectl logs'
alias kgn='kubectl get nodes'
alias kinfo='kubectl cluster-info'
alias kgd='kubectl cluster-info dump'
alias kcn='kubectl create ns'
alias kdt='kubectl delete ns'
alias kc="kubectl create -f"
alias kds="kubectl describe svc"
alias kgit='kubectl get pods --namespace=gitlab'
alias ngl='kubectl get svc --namespace=ingress-nginx'
alias alln='helm list --all-namespaces'
alias ing='k get ing -A'
alias ielb='kubectl get svc --namespace=ingress-nginx'
alias glab='k get pod -n gitlab -w'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
export PATH=$PATH:$HOME/bin

alias n='kubectl get ns'
alias p='kubectl get pod'
alias s='kubectl get svc'
alias all='kubectl get pods --all-namespaces'
alias dp='kubectl get deployment'
alias stor='kubectl get storageclass'

alias infra='sudo cp ~/.kube/clusters/infra.config ~/.kube/config && kns && node'
alias ranch='sudo cp ~/.kube/clusters/rancher.config ~/.kube/config && kns && node'
alias prod='sudo cp ~/.kube/clusters/prod.config ~/.kube/config && kns && node'
alias dev='sudo cp ~/.kube/clusters/dev.config ~/.kube/config && kns && node'
alias sec='sudo cp ~/.kube/clusters/security.config ~/.kube/config && kns && node'
alias vau='sudo cp ~/.kube/clusters/vault.config ~/.kube/config && kns && node'
alias ob='sudo cp ~/.kube/clusters/observability.config ~/.kube/config && kns && node'
alias gitlab='sudo cp ~/.kube/clusters/gitlab.config ~/.kube/config && kns && node'
alias kendopx='sudo cp ~/.kube/clusters/kendopx.config ~/.kube/config && kns && node'

alias infra='sudo cp ~/.kube/clusters/infra.config ~/.kube/config && kns && node'
alias prod1='sudo cp ~/.kube/clusters/prod1.config ~/.kube/config && kns && node'
alias nprod='sudo cp ~/.kube/clusters/nprod.config ~/.kube/config && kns && node'
alias test='sudo cp ~/.kube/clusters/test.config ~/.kube/config && kns && node'
alias cka='sudo cp ~/.kube/clusters/cka.config ~/.kube/config && kns && node'
alias ranp='sudo cp ~/.kube/clusters/prod-rancher.config ~/.kube/config && kns && node'
alias codebase='cd /Users/swilliams/Documents/CODEBASE'
alias desktop='cd /Users/swilliams/Desktop'
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

alias meta-ips='k get svc --all-namespaces --no-headers | awk '{print $5}' | grep -v none'
alias see-all='kubectl get deployments,services,pods -n'

#### Argo CLI
alias argo-login='argocd login argocd.kendopz.com --username admin --password Redhat123 --insecure'
alias argo-logout='argocd logout argocd.kendopz.com'
alias argo-sso='argocd login  argocd.kendopz.com --sso'

### Switching Between Contexts
alias get-clusters='kubectl config get-clusters'
alias get-users='kubectl config get-users'
alias get-current='kubectl config current-context'
alias use-context='kubectl config use-context'
alias get-contexts='kubectl config get-contexts'

### delete
alias delete-all='kubectl delete daemonsets,replicasets,services,deployments,pods,rc,ingress --all -n'
alias all='kubectl get pods --no-headers=true --all-namespaces'

### APPS UI 
alias argo-ui='~/scripts/argo-ui.sh'
alias gitlab-ui='~/scripts/gitlab-ui.sh'
alias keycloak-ui='~/scripts/keycloak-ui.sh'
alias jupyter-ui='~/scripts/jupyter-ui.sh'
alias see-pods='kubectl get pods --all-namespaces'
alias restart-argo='kubectl delete --all pods -n argocd; kubectl get pods -n argocd'
alias arco='cd /mnt/c/CODEBASE/workspace/argocd-app-config'
# k9s
# kubectx
# kubens 

#PROMPT='$(kube_ps1)'$PROMPT
function get_namespace_upper() {
    echo "$1" | tr '[:lower:]' '[:upper:]'
}

export KUBE_PS1_NAMESPACE_FUNCTION=get_namespace_upper

export KUBECTX_CURRENT_FGCOLOR=$(tput setaf 6) # blue text
export KUBECTX_CURRENT_BGCOLOR=$(tput setab 7) # white background

### alias update-context="'KUBECONFIG=$(find ~/.kube/clusters -type f | sed ':a;N;s/\n/:/;ba') kubectl config view --flatten > ~/.kube/config'"
#
alias tfip='terraform init && terraform fmt && terraform validate && terraform plan'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='time terraform fmt && terraform validate && terraform apply -auto-approve'
alias tfd='terraform destroy -auto-approve'

# govc find / -type f
# govc find / -type s
# govc find / -type p

alias vms='govc ls /DEV-DC/vm'
alias arg='cp ~/.kube/clusters/argo.config ~/.kube/config && kns && node'

#go run main.go
#go run main.go –url https://vcenter.kendopz.com\\api:Soly2020!123@@solomon@vsphere.local/sdk –insecure true


alias tcleanup='rm -rf .terraform .terraform.lock.hcl  terraform.tfstate.backup terraform.tfstate && rm -rf .terraform.tfstate.lock.info'

# govc ls
# govc ls   /*/vm/*
# govc ls /DEV-DC/vm
# govc find /Datacenter/vm/template_folder -type m

# https://github.com/vmware/govmomi/releases/download/v0.30.4/govc_Linux_arm64.tar.gz
# govc vm.power -s=true myvm-001
# govc vm.power -off=true myvm-001
# govc vm.power -on=true myvm-001

#// vmpath=$(govc vm.info test-1.kendopz.com | grep "Path:" | awk {'print $2'})
#// govc ls -l -json $vmpath

#govc vm.power -r=true test-1.kendopz.com

complete -F __start_velero v

alias tcleanup='rm -rf .terraform .terraform.lock.hcl  terraform.tfstate.backup terraform.tfstate'
alias list-eks='eksctl get cluster'

### Update context 
## alias update-context="'KUBECONFIG=$(find ~/.kube/clusters -type f | sed ':a;N;s/\n/:/;ba') kubectl config view --flatten > ~/.kube/config'"

####
[ -f ~/.kubectl_aliases ] && source \
   <(cat ~/.kubectl_aliases | sed -r 's/(kubectl.*) --watch/watch \1/g')

##### Vault 

alias vault-po='kubectl get po -n vault'

### How To Get All The Domain Records For Your Account From Route53
###alias aws-53='aws route53 list-hosted-zones|jq '.[] | .[] | .Id' | sed 's!/hostedzone/!!' | sed 's/"//g'> zones'

### AMI finder
alias ami-finder='bash /Users/swilliams/scripts/ami.sh'

### Update EKS
alias update-eks='aws eks update-kubeconfig'

### Delete EKS 
alias delete-elb='aws elb delete-load-balancer --load-balancer-name' 

### List ELB 
alias list-elb='aws elb describe-load-balancers --query LoadBalancerDescriptions[*].LoadBalancerName'

### Argocd 
alias argocd-build='cd /Users/swilliams/Documents/CODEBASE/training-curriculum/7-argocd-course/argocd-course/docs/argocd-build'

alias list-keys='aws iam list-access-keys --user-name developer'
alias list-kms='aws kms list-keys'
alias keypair='aws ec2 describe-key-pairs'
alias list-route53='aws route53 list-hosted-zones'
source <(hcloud completion zsh)
autoload -Uz compinit; compinit

alias hclist='hcloud server list'

### Terminate EC2
alias terminate='aws ec2 terminate-instances --instance-id'

####### Install Jira 

alias install-jira='~/scripts/jira-install.sh'
alias uninstall-jira='~/scripts/jira-uninstall.sh'

### Install EKS
alias deploy-eks='~/eks/deploy-eks.sh'
alias act='source aws-ansible-env/bin/activate'

PATH=~/.console-ninja/.bin:$PATH
