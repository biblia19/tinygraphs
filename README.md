greentros
==============

avatar generator web service

Contributors
=============

* [Santiago](https://github.com/santiaago)
* [Remy](https://github.com/rjourde)

Organization
=====

Lets start with a milestone each 2 weeks for now.

Stack
======

* Go
* mongodb
* heroku

Installation
======

*   `cd $GOPATH/src`
*   `go get github.com/taironas/greentros`
*   `cd $GOPATH/src/github.com/greentros`
*   `go get ./app-backend`
*   `export PORT=8080`

Run App
=======

    > pwd
    $GOPATH/src/github.com/taironas/greentros
    > app-backend
    2014/11/19 22:23:57 Listening on 8080

Build
======
    >cd $GOPATH/src/github.com/greentros
    >go get ./app-backend

Test locally
=============
option 1:

    > app-backend
    2014/12/07 00:35:02 Listening on 8080

option 2:

If you have heroku install you should be able to run 

    > foreman start
    00:37:38 web.1  | started with pid 5762
    00:37:38 web.1  | 2014/12/07 00:37:38 Listening on 8080

Deploy
=======
Before you start be sure to have the proper rsa key. [See Managing Your SSH Keys](https://devcenter.heroku.com/articles/keys) for more details and that. Also be sure to be logged in with heroku.

    > heroku login
    Enter your Heroku credentials.
    Email: ga@greentros.com
    Password: 
    
After that you can deploy as follows:
    
    > git push heroku master
    Fetching repository, done.
    Counting objects: 5, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 287 bytes | 0 bytes/s, done.
    Total 3 (delta 2), reused 0 (delta 0)
    
    -----> Fetching custom git buildpack... done
    -----> Go app detected
    -----> Using go1.3
    -----> Running: go get -tags heroku ./...
    -----> Discovering process types
           Procfile declares types -> web
    
    -----> Compressing... done, 1.5MB
    -----> Launching... done, v6
           https://greentros.herokuapp.com/ deployed to Heroku
    
    To git@heroku.com:greentros.git
       56a3000..5572085  master -> master


