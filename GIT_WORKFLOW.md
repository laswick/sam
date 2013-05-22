
# GIT Workflow

Rob Laswick  
April 25 2013  
[www.laswick.net](http://www.laswick.net)

***

## Please follow the recommended git workflow below:



1. Clone the git repository, if you haven't already

        git clone git@github.com:laswick/sam.git sam.git


2. Create a working branch to develop in

        git checkout -b working


3. Make your changes, experiment, and commit often

        git commit -a


4. When you're ready to push your changes to the server, first ensure your  master branch is up to date

        git checkout master
        git pull


5. Once your master branch is up to date, merge in your changes

        git merge --squash working


6. Commit your changes, and **BE SURE TO EDIT** the commit log so it's meaningful

        git commit


7. Push your changes to the server

        git push


8. Continue your development from a clean slate

        git branch -D working
        git checkout -b working


9. Rinse and Repeat!

