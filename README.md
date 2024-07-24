# Flask Portfolio Tracker

## Description

Cette application Flask permet de suivre des fonds, des instruments et des positions associées. Elle utilise une base de données MySQL pour stocker les informations.

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés :
- Python 3.x
- MySQL Server
- Python Libraries (listées dans `requirements.txt`)

## Installation

1. **Cloner le dépôt**
    ```bash
    git clone https://github.com/notRiyad/flask-portfolio-tracker.git
    cd flask-portfolio-tracker
    ```

2. **Installer les dépendances**
    ```bash
    pip install -r requirements.txt
    ```

3. **Configurer la base de données**

   Modifiez la ligne suivante dans `app.py` pour inclure vos informations de connexion à la base de données :
   
    ```python
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://USERNAME:PASSWORD@HOST/DATABASE'
    ```
   
   Remplacez `USERNAME`, `PASSWORD`, `HOST`, et `DATABASE` par les valeurs appropriées :
   - `USERNAME`: Nom d'utilisateur pour la base de données
   - `PASSWORD`: Mot de passe pour l'utilisateur de la base de données
   - `HOST`: Adresse de l'hôte de la base de données (typiquement `localhost`)
   - `DATABASE`: Nom de la base de données

4. **Initialiser la base de données**

   Assurez-vous que votre base de données MySQL est en cours d'exécution. Utilisez le script `init_db.sql` pour créer les tables nécessaires dans la base de données en exécutant la commande suivante dans votre terminal :
    ```bash
    mysql -u <USERNAME> -p < init_db.sql
    ```
    
5. **Lancer l'application**
    ```bash
    python3 app.py
    ```

6. **Accéder à l'application**

   Ouvrez votre navigateur et allez à l'adresse suivante :
   - [Accueil](http://127.0.0.1:5000/)
   - [Fonds](http://127.0.0.1:5000/fonds)
   - [Instruments](http://127.0.0.1:5000/instruments)
   - [Positions](http://127.0.0.1:5000/positions/<fond_id>)

## Développement

- **Ajouter des données** : Vous pouvez ajouter des données directement dans la base de données via des outils comme MySQL Workbench ou phpMyAdmin.
- **Supprimer des données** : Vous pouvez supprimer des données de la même manière pour voir les changements reflétés dans l'application web.

## Aide

Pour toute question ou problème, consultez la documentation Flask ou demandez de l'aide dans les forums appropriés.
