$ErrorActionPreference = 'Stop'
refreshenv
ridk install 3
gem install bundler
gem install jekyll -v 4.4.0

Write-Warning @'
###    Jekyll - QUICKSTART    ###

> jekyll new c:\srv\www\mywebsite
> cd c:\srv\www\mywebsite
> bundle exec jekyll serve

- Browse to http://localhost:4000
#################################

'@
