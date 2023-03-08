# Ancible Core
Template for new ansible projects

Used `Makefile` and roles

## Install 
Go to path with new project and execute:
```
curl https://raw.githubusercontent.com/john-ansible/core/main/init.sh | bash
```

## Update

```
make up
```

## make
**Makefile**
  - info: get full info about host
  - up: update core and download/update ansible-roles
  - wikidocs: generate server pages for wikiserver

### example
`make info hosts=node.example.com` - get info about *node.example.com*  
`make zbx hosts=gw.example.com` - install role **zbx** for *gw.example.com*  
`make init` - install role **init** for *ALL*  
`make` - install **ALL** roles for *ALL*  
`make up -e localonly` - update roles only from requirements_local.yml (if it is exist)
