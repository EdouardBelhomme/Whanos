## Whanos

Github Action -> Jenkins -> Deploiement d'un container docker dans le cluster kubernetes.

## Github Action
Push sur notre repos,
Github action va démarrer jenkins.

## Jenkins
3 Jobs, dont 1 qui permet de recup un repos,
on build l'image et run sur le cluster.

## Cluster Kube
Lien avec Jenkins qui a le droit d'envoyer les images et de run sur le cube,


Jenkins, pour recup un repo github,
avec les job adapter,

créer une image avec les fichier,
lier avec le cluster

### WHANOS-COMPATIBLE REPOSITORY SPECIFICATIONS
In order for a repository to be usable within the Whanos infrastructure, it must contain a single application
(written in a supported language), whose source code and resources are in an app directory placed at the root of the repository.
This section details the structure of the repositories that are considered compatible with the infrastructure to be created, not the delivery repository in which you will have to turn your project in.

### SUPPORTED LANGUAGES
The following languages must be supported by your Whanos infrastructure:
• C;
• Java;
• JavaScript;
• Python;
• Befunge.

### JENKINS INSTANCE
In order for the applications to be automatically containerized and deployed, you will use Jenkins.
The Jenkins Configuration as Code approach, which you used in the my_marvin project, is not mandatory for this project, but is still a great approach for you to use, since having an entire configuration just within a file greatly helps in setting up and deploying the Jenkins instance.
The Jenkins instance must meet the specifications detailled below.

### USERS
Signing up must be disallowed.
A user named Admin must be created and must have:
- an id admin;
- all the rights.
Further users can be created if desired.

### FOLDERS
WHANOS BASE IMAGES
• Is named Whanos base images.
• Is at root.
PROJECTS
• Is named Projects.
• Is at root.

### JOBS
Each of the following jobs is expected to be enabled and to be a freestyle job.
WHANOS BASE IMAGES BUILD JOBS
For each supported language, a job must be created, and must:
• be named like the language’s base image name (e.g.: whanos-haskell);
• be in the Whanos base images folder;
• build the corresponding base image so that it is available for the Jenkins instance host to use.

### BUILD ALL BASE IMAGES
• Is named Build all base images.
• Is located in the Whanos base images folder.
• When executed, triggers all base images build jobs.

### LINK-PROJECT
• Is named link-project.
• Is at root.
• Has the necessary parameters to perform its task.
• When executed, links the specified project in the parameters to the Whanos infrastructure by creating
a job with the specifications listed below.

### JOBS CREATED BY THE link-project JOB
Each job created by the link-project job:
• Is in the Projects folder.
• Checks every minute for changes in the repository.
• When a change is detected:
• containerizes the respository’s application according to the specifications described in the Whanos
images specifications section;
• if applicable, deploys the application into a Kubernetes cluster (see below).


cluster en fonction de si il y a un fichier whanos.yml

sinon build avec un whanos-{language}