## En quoi consiste ce sujet ?

Docker est un système permettant de gérer des containers.
C'est un produit développé par la société du même nom. Initialement développé par un ingénieur français, **Solomon Hykes**, le produit a été dévoilé en mars 2013. 

## A quoi cela sert ?

Avant d’aborder Docker, il est indispensable de rappeler ce qu’est une **image container**. Il s’agit d’un ensemble de processus logiciels léger et indépendant, regroupant tous les fichiers nécessaires à l’exécution des processus : code, runtime, outils système, bibliothèque et paramètres. Ils peuvent être utilisés pour exécuter des applications Linux ou Windows.

Les containers sont donc proches des machines virtuelles, mais présentent un avantage important. **Alors que la virtualisation consiste à exécuter de nombreux systèmes d’exploitation sur un seul et même système, les containers se partagent le même noyau de système d’exploitation et isolent les processus de l’application du reste du système**.

Pour faire simple, plutôt que de virtualiser le hardware comme l’hyperviseur, le container virtualise le système d’exploitation. **Il est donc nettement plus efficient qu’un hyperviseur en termes de consommation des ressources système**. Concrètement, il est possible d’exécuter près de 4 à 6 fois plus d’instances d’applications avec un container qu’avec des machines virtuelles comme Xen ou KVM sur le même hardware.

## En bref c'est quoi ?

Docker permet de créer des environnements (appelées containers) de manière à isoler des applications.

Grâce à Docker, multipliez les environnements sur votre machine, sans limiter les performances de votre ordinateur. Les ressources sont partagées avec la machine hôte ! Chaque environnement peut être configuré simplement grâce à son Dockerfile, présent à sa racine.

## Sur quelle partie d'un projet faut-il le mettre en place ? A quel moment du projet faut-il le mettre en place ?

On pense d'abord à Docker pour déployer facilement une application, puisqu'elle sera livrée avec toutes ses dépendances dans un environnement isolé, cela évite les bugs et fait gagner du temps en plus de permettre l'automatisation. 

Mais Docker peut être mis en place dès le début du projet pour permettre aux devs, devops et testeurs d'avoir la même base de code pour tester et déployer le projet au fur et à mesure de son avancement 

## Au moins 5 mots de vocabulaires propres à ce domaine qui permettent de mieux le comprendre?

**Containers**: la base
**Virtual Machines**: l'ancêtre
**Cloud**: Les services de cloud (AWS, Azure...)peuvent être facilement alimentés avec des images dockers
**Docker Hub**: partages d'images prêtes à l'emploi
**Docker Swarm**: Pour un projet on peut avoir différentes images, déployer sur différentes machines, Docker Swarm permet de les gérer.

## Comment le réaliser? quels sont les outils? quels sont les différents étapes?

Docker repose sur une API RESTFul. À cela, l'entreprise a associé un « docker-cli » permettant de facilement exécuter des commandes depuis notre terminal.

Depuis un terminal, si vous exécutez la commande docker, vous obtiendrez une liste de commandes exécutables, que voici :

```bash
$ docker
…
Commands:
    attach    Attach to a running container
    build     Build an image from a Dockerfile
    commit    Create a new image from a container's changes
    cp        Copy files/folders from a container's filesystem to the host path
    create    Create a new container
    diff      Inspect changes on a container's filesystem
    events    Get real time events from the server
    exec      Run a command in an existing container
    export    Stream the contents of a container as a tar archive
    history   Show the history of an image
    images    List images
    import    Create a new filesystem image from the contents of a tarball
    info      Display system-wide information
    inspect   Return low-level information on a container
    kill      Kill a running container
    load      Load an image from a tar archive
    login     Register or log in to a Docker registry server
    logout    Log out from a Docker registry server
    logs      Fetch the logs of a container
    port      Lookup the public-facing port that is NAT-ed to PRIVATE_PORT
    pause     Pause all processes within a container
    ps        List containers
    pull      Pull an image or a repository from a Docker registry server
    push      Push an image or a repository to a Docker registry server
    restart   Restart a running container
    rm        Remove one or more containers
    rmi       Remove one or more images
    run       Run a command in a new container
    save      Save an image to a tar archive
    search    Search for an image on the Docker Hub
    start     Start a stopped container
    stop      Stop a running container
    tag       Tag an image into a repository
    top       Lookup the running processes of a container
    unpause   Unpause a paused container
    version   Show the Docker version information
    wait      Block until a container stops, then print its exit code
…
```

### Le fichier Dockerfile

*FROM* tells Docker which image you base your image on (e.g.Python 3).

*RUN* tells Docker which additional commands to execute.

*CMD* tells Docker to execute the command when the image loads.


## Mini-tuto

install

```bash
sudo apt install docker.io
```
project files
```bash
mkdir docker-streamlit
touch app.py
touch Dockerfile
```
app.py
```python
import streamlit as st
st.balloons()
st.write('Successful Dockerization!')
```
Dockerfile
```bash
FROM python:3
ADD app.py /
RUN pip install streamlit
CMD [ "streamlit", "run", "./app.py" ]
```
post-install (pour éviter de devoir run avec sudo)
```bash
sudo groupadd docker
sudo usermod -aG docker ${USER}
su -s ${USER} # ou relog
# si besoin
sudo systemctl restart docker
sudo chmod 666 /var/run/docker.sock
```
build
```bash
docker build -t streamlit-docker .
```
run
```bash
docker run python-docker
```



### Liens
install : https://docs.docker.com/engine/install/linux-postinstall/

first try : https://runnable.com/docker/python/dockerize-your-python-application

deploy FastAPI : https://fastapi.tiangolo.com/deployment/docker/