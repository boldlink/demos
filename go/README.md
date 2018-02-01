# Deploy GO App locally with Vagrant


This is for fun and demo only, it is  not inteded 
for production or as an example of good patterns, 
it just works.

Profit!

## Requirements for your host machine:

- Tested on MacOs X 10.13.1
- Vagrant (2.0.1 recommended)
- Virtualbox (5.1.30 recommeded)
- go (1.9.2 recommended)


## What are you deploying:

* webServer 1 => Ubuntu Zeisty nGinx LB with RoundRobin to App1/2 on http://localhost:8484
* appServer 1/2 => Ubuntu Zeisty runnig go excutable

## Setps:


### 1) CLONE this repo:

$ git clone --depth 1 https://github.com/boldlink/devops.git && cd devops/demos/go

### 2) Run the following command to start the stack:

$ env GOOS=linux GOARCH=amd64 go build -a -o build/app src/app.go && vagrant up

### 3) To reload the configurations/app run this command:

$ env GOOS=linux GOARCH=amd64 go build -a -o build/app src/app.go && vagrant reload

### 4) To delete the stack run this command, due to some bug (maybe vagrant) you might have to run this command several times:

$ vagrant destroy -f

## Changing the code:

### 1) Stack:

Contents structure:
* README.md 		==> Read me
* Vagrantfile 		==> The vms config file
* build/			==> Should be empty   
* conf/lb.conf 		==> Load Balancer config
* scripts/app.sh 	==> App startup script
* scripts/lb.sh 	==> Lb startup script
* src/app.go 		==> app code



Vagrant code is (almoust) immutable, you should only really have to edit these settings:

* **vms = {}**

Change these value to adapt to your own host machine available port:
* **:host => 80,**

All the start up scripts are on the folder **scripts/** edit them at your content

### 2) Build Go:

You'll find the code on the **src/** folder.
App servers will run the standalone executable, build it with the following command.

$ env GOOS=linux GOARCH=amd64 go build -a -o build/app src/app.go

**Note:** .gitignore wont push any contents of the build folder by design.

And follow step 3 (above) to reload your application.

**Note:** this will overwrite the existing go executable

