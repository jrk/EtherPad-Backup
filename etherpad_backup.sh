#!/bin/bash

# settings
USERNAME  = ""
EMAIL     = "" # replace @ with %40 ?
PASSWORD  = ""
FORMAT    = "txt"

if [ -d ~/etherpads ];
then 
    cd ~/etherpads
else
    mkdir ~/etherpads
    chmod u=rwx ~/etherpads
    cd ~/etherpads
fi

#--------- HEADERS CAPTURE -------------
#POST /ep/account/sign-in?&cont=https%3a%2f%2fpstam.etherpad.com%2f HTTP/1.1
#Host: pstam.etherpad.com
#User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.1.2) Gecko/20090729 Firefox/3.5.2
#Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
#Accept-Language: en-us,en;q=0.5
#Accept-Encoding: gzip,deflate
#Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
#Keep-Alive: 300
#Connection: keep-alive
#Referer: https://pstam.etherpad.com/ep/account/sign-in?&cont=https%3a%2f%2fpstam.etherpad.com%2f
#Cookie: ET=0560da5f319b93b5; prefs=%7B%22viewZoom%22%3A100%7D; ASIE=F; ES=b5f5c1b69a4e3cd1; ES=c5682e7dd2f7c3c0
#Content-Type: application/x-www-form-urlencoded
#Content-Length: 37
#email=REMOVED&password=REMOVED
#HTTP/1.x 302 Found
#Expires: Sat, 18 Jun 1983 07:07:07 GMT
#Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0
#Last-Modified: Sat, 08 Aug 2009 18:27:34 GMT
#Pragma: no-cache
#Set-Cookie: ASIE=F; expires=Wed, 01-Jan-3000 08:00:00 GMT; domain=pstam.etherpad.com; path=/
#Location: https://pstam.etherpad.com/
#Content-Length: 0
#Server: Jetty(6.1.x)


curl --basic -A 'Mozilla/5.0' -s -d "email=$EMAIL&password=$PASSWORD" https://pstam.etherpad.com -v
curl 'ep/pad/export/6/latest?format=txt'
#curl -F 'email=$EMAIL&password=$PASSWORD' -A 'Mozilla/5.0' https://pstam.etherpad.com


#pad=2
#pad_url="https://$USERNAME.etherpad.com/ep/pad/export/$pad/latest?format=$FORMAT"


#curl -0 https://pstam.etherpad.com/ep/pad/export/6/latest?format=txt

#for pad in {1..5}
#do
#    curl -0 $pad_url
#done

#BUCKET = bucketname
#NOW=$(date +_%b_%d_%y)
#tar czvf etherpads$NOW.tar.gz .
#ruby s3sync.rb -r ––ssl etherpads/ $BUCKET:


