# FinalProject
This is the source code for a wordcloud app which runs on R and Shiny. 
To run it locally, you'll need to install the latest version of packages.

```r
install.packages(c('shiny', 'wordcloud2', 'tm', 'colourpicker'))
```
## A simple deployment script to a remote machine

clone the application from Github

```
git clone https://github.com/XUYEMAY/FinalProject.git

```

Create a shortcut in /srv/shiny-server/
```
$ cd /srv/shiny-server
$ sudo ln -s ~/FinalProject
```

Notes:
Don't forget install packages
```
$ sudo su - shiny
$ R
> install.packages(c('shiny', 'wordcloud2', 'tm', 'colourpicker'))
q()
```
