📌 Description du script – Importation d’utilisateurs Active Directory depuis un CSV
Ce script PowerShell permet l’importation en masse d’utilisateurs dans Active Directory à partir d’un fichier CSV contenant les informations personnelles (prénom, nom, nom d’utilisateur).

Il est utile pour automatiser l’onboarding d’un grand nombre de collaborateurs dans un domaine AD.

🔧 Fonctionnement
Le script lit un fichier CSV contenant les colonnes suivantes :
- Prenom
- Nom
- Username

Pour chaque ligne du fichier :
- Il génère le SamAccountName et le UserPrincipalName
- Il crée l'utilisateur dans l'OU définie
- Il lui assigne un mot de passe par défaut (Password123!) et active le compte

📄 Exemple de fichier utilisateurs.csv
- csv
- Copier
- Modifier
- Prenom,Nom,Username
- Alice,Dupont,adupont
- Bob,Martin,bmartin
- Claire,Durand,cdurand
  
✏️ Paramètres personnalisables
- $CSVPath : chemin vers le fichier CSV
- $OU : chemin LDAP complet de l’unité d’organisation cible
- Le mot de passe par défaut est Password123! (à changer selon votre politique de sécurité)

⚠️ Remarques
- Le script suppose que le module ActiveDirectory est installé et disponible
- Les noms d’utilisateur (SamAccountName) doivent être uniques
- Pensez à forcer la réinitialisation du mot de passe à la première connexion si nécessaire (-ChangePasswordAtLogon $true)
- Dans l'exemple le fichier CSV est situé dans le dossier U sur C:
