alias ag="ag --hidden --path-to-ignore ${IGNORE_FILE}"
alias rg="rg --hidden --smart-case --ignore-file ${IGNORE_FILE}"
alias sls="npx serverless"
alias https='http --default-scheme=https'
alias k='kubectl'
alias npr='npm run'
alias clipbase64decode="clippaste | base64 -d | clipcopy"
alias clipbase64encode="clippaste | base64 | clipcopy"
alias clipjq="clippaste | jq"
alias clipjsonformat="clippaste | jq | clipcopy"

formatjson () { jq . $1 | sponge $1 }
