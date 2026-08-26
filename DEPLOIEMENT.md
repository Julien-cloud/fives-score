# Mettre Fives League en ligne

1. Crée un projet sur Supabase. Dans SQL Editor, exécute `supabase-schema.sql`. Le script contient les quatre administrateurs déclarés dans `admin-emails.js`.
2. Dans Authentication > URL Configuration, ajoute l'URL Vercel finale dans Site URL et Redirect URLs.
3. Dans Project Settings > API, copie **Project URL** et la clé **anon public**.
4. Mets le contenu du dossier `outputs` dans un dépôt GitHub, puis importe ce dépôt sur Vercel. Aucun réglage de build n'est nécessaire.
5. Ouvre le site publié et connecte-toi depuis Réglages avec l'une des adresses administratrices, via le lien reçu par e-mail.

Les joueurs n'ont pas besoin de compte : ils lisent les statistiques publiquement. Seules les quatre adresses administratrices peuvent modifier les joueurs et les matchs.

## Ajouter le suivi des buts à une base existante

Exécute une seule fois `supabase-migration-goals.sql` dans Supabase > SQL Editor. Cette migration ajoute le nombre de buts à chaque participation sans supprimer ni modifier l'historique existant.

Ne colle jamais la clé `service_role` dans le site ; seule la clé `anon public` doit être utilisée.
