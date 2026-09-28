Import-Csv "C:\NovosFuncionarios.csv" | ForEach-Object {
    New-CorpUser -Nome $_.Nome -Sobrenome $_.Sobrenome -NomeOU $_.OU -Departamento $_.Departamento
}  
