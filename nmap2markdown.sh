#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 [nmap_grepable_file]"
  echo "To get a greppable file on Nmap, use the -oG flag"
  exit 1
fi

if [ ! -f $1 ]; then
  echo "File $1 not found"
  exit 1
fi

echo "Nmap2Markdown - Convert Nmap Output to Markdown Headers"

grep -Eo '[0-9]+/open/tcp//[^/]+' $1 | sed -r 's/([0-9]+)\/open\/tcp\/\/(.+)/\1 - \2/' | sort -n | uniq | while read line; do
  port=$(echo "$line" | cut -d" " -f1)
  service=$(echo "$line" | cut -d" " -f3-)
  echo "## $port - $service"
  echo -e "\n"
  grep -Eo "${port}/open/tcp//${service}//[^/]+" $1 | sed -r "s/${port}\/open\/tcp\/\/${service}\/\/(.+)/\1/"
  
  #Notion imports the markdown code as plain text, ignoring the language
  #echo '```bash'
  #echo '```'
  
  
done
