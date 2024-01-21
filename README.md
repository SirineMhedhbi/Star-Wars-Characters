# README

# Projet Rails - Liste des Personnages Star Wars

Ce projet Rails a été créé dans le but de consommer l'API Star Wars (https://swapi.dev) et d'afficher une liste de personnages groupés par film, dont la masse est supérieure à 75.

## Modèles

### Character

Le modèle `Character` représente un personnage de l'univers Star Wars.

**Attributs :**

- `name` (String) : Le nom du personnage.
- `masse` (String) : La masse du personnage.
- `homeworld` (String) : Le nom de la planète d'origine du personnage.
- `Films` (string): représente les films dans lesquels le personnage a participé.

### Characters Controller

Le contrôleur `CharactersController` gère les actions liées à l'affichage des personnages sur la page web.

**Actions :**

- `index` : Récupère la liste des personnages depuis l'API, filtre ceux dont la masse est supérieure à 75, et les organise par film. Puis, rend la vue correspondante.

### Vues

1. **Index (index.html.erb) :** La vue affiche la liste des personnages groupés par film. Chaque groupe de personnages affiche le nom du film suivi d'une liste de personnages avec leur nom, leur masse et le nom de leur planète d'origine.

## Configuration requise

- Ruby version 3.0.2
- Rails version 7.1.3

## Installation

1. Clonez le dépôt
   ```bash
   git clone https://github.com/SirineMhedhbi/Star-Wars-Characters.git
   ```
