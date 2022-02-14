# print line number which match grep pattern
zcat application-2022-02-07.log.gz | grep --line-number FornecedorSuspensoActor

# printout from line number 410540 to 410649p
zcat application-2022-02-07.log.gz | sed -n '410540,410649p'
