# General Alias
alias ll='ls -lA'
alias mount_d="sudo mkdir -p /mnt/d && sudo mount -t drvfs D: /mnt/d -o metadata"
alias umount_d="sudo umount /mnt/d"


# ZSH
# zsh navigation
alias aliases='n-aliases'
alias history='n-history'
alias printenv='n-env'
alias cdh='n-cd'


# Docker
alias aws='docker run --rm -it -v aws-vol:/root/.aws amazon/aws-cli'
alias mongo='docker run --rm -ti mongo mongo --host'
alias psql='docker run --rm -ti postgres psql'
alias pgadmin="docker run --rm -d \
	--name pgadmin \
	-v pgadmin-vol:/var/lib/pgadmin \
	-p 5050:80 \
	-e PGADMIN_DEFAULT_EMAIL=admin@pgadmin.com \
	-e PGADMIN_DEFAULT_PASSWORD=admin \
	dpage/pgadmin4 \
	&& echo -e '\nURL: \t\t http://localhost:5050 \n\nEMAIL: \t\t admin@pgadmin.com \nPASSWORD: \t admin' "
alias notebook='docker run --rm --name notebook -p 8888:8888 -d jupyter/base-notebook && sleep 1.5 && docker logs --tail 5 notebook'


