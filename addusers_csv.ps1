# Importation des utilisateurs depuis un fichier CSV
$CSVPath = "C:\u\utilisateurs.csv" # Remplacez par le chemin de votre fichier CSV
$Utilisateurs = Import-Csv -Path $CSVPath

# Paramètres
$OU = "OU=Users,OU=UTILISATEURS,DC=CRINEXLAB,DC=LOCAL" # Remplacez par votre OU cible

# Création des utilisateurs
foreach ($Utilisateur in $Utilisateurs) {
    $NomComplet = "$($Utilisateur.Prenom) $($Utilisateur.Nom)"
    New-ADUser -Name $NomComplet `
               -GivenName $Utilisateur.Prenom `
               -Surname $Utilisateur.Nom `
               -SamAccountName $Utilisateur.Username `
               -UserPrincipalName "$($Utilisateur.Username)@crinexlab.local" `
               -Path $OU `
               -AccountPassword (ConvertTo-SecureString "Password123!" -AsPlainText -Force) `
               -Enabled $true `
               -PassThru
}
