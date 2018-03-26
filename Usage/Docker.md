## Docker
#### Health&Help Site Project Deployment
```
$ sudo gpasswd -a username docker  ;;; relogin to enable the docker group
$ sudo docker daemon

$ git clone https://github.com/koluch/hehe
$ cd hehe/

$ docker build -f dev.Dockerfile -t hehe .

$ docker run -it -p 3000:80 -v $(pwd):/var/www/site hehe

$ composer update

# npm install
# gulp
# yii migrate
```
- Cloning the fork:
```
$ git clone https://github.com/Tyrn/site hehe
$ git remote add upstream https://github.com/he-he-org/site
```
- Cyncing:
```
$ git fetch upstream                  ;; upstream optional?
$ git checkout master                 ;; not needed?
$ git merge upstream/master
```
