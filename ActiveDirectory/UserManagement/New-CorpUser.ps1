# irm "https://raw.githubusercontent.com/Torres1616/Powershell_Facilidades/main/ActiveDirectory/UserManagement/New-CorpUser.ps1" | iex
function New-CorpUser {
    param(
        [Parameter(Mandatory=$true)][string]$Nome,
        [Parameter(Mandatory=$true)][string]$Sobrenome,
        [Parameter(Mandatory=$true)][string]$NomeOU,
        [Parameter(Mandatory=$true)][string]$Departamento
    )

    # Deteta automaticamente o DistinguishedName do domínio atual
    $DomainDN = (Get-ADDomain).DistinguishedName
    $SamAccountName = "$($Nome.ToLower()).$($Sobrenome.ToLower())"
    $OUPath = "OU=$NomeOU,$DomainDN"

    New-ADUser -Name "$Nome $Sobrenome" `
        -GivenName $Nome `
        -Surname $Sobrenome `
        -SamAccountName $SamAccountName `
        -UserPrincipalName "$SamAccountName@$((Get-ADDomain).DNSRoot)" `
        -Path $OUPath `
        -Department $Departamento `
        -AccountPassword (ConvertTo-SecureString "SenhaPadrao123!@#" -AsPlainText -Force) `
        -ChangePasswordAtLogon $true `
        -Enabled $true
}
