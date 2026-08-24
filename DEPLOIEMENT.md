# Mettre Fives League en ligne

1. Crée un projet sur Supabase. Dans SQL Editor, exécute `supabase-schema.sql` après avoir remplacé l'e-mail administrateur.
2. Dans Authentication > URL Configuration, ajoute l'URL Vercel finale dans Site URL et Redirect URLs.
3. Dans Project Settings > API, copie **Project URL** et la clé **anon public**.
4. Mets le contenu du dossier `outputs` dans un dépôt GitHub, puis importe ce dépôt sur Vercel. Aucun réglage de build n'est nécessaire.
5. Ouvre ton site publié, va dans Réglages, ouvre « Connecter Supabase », et colle l'URL et la clé anon. Connecte-toi ensuite via le lien reçu par e-mail.

Les joueurs n'ont pas besoin de compte : ils lisent les statistiques publiquement. Seul l'e-mail défini dans le script SQL peut ajouter des joueurs et des matchs.

Ne colle jamais la clé `service_role` dans le site ; seule la clé `anon public` doit être utilisée.
