# nmap2markdown
### Clone repository
```bash
git clone https://github.com/d4skor/nmap2markdown.git
cd nmap2markdown
chmod +x ./nmap2markdown.sh
```

### Export Nmap Scan to a greppable format using -oG <filename>
```bash
nmap -sV -p- 127.0.0.1 -oG scan.txt
```
### Run the script with the scan results
```bash
./nmap2markdown scan.txt
```
  
  Then, just copy all the output and paste it into any markdown editor, such as Obsidian, Notion...
  It will turn each port to a Header 2, with the port numer and service as the title. Also, the Service
  Version gets pasted on the body of that header section.
  
  ````bash
  ./nmap2markdown.sh scan.txt                                   
Nmap2Markdown - Convert Nmap Output to Markdown Headers
## 53 - domain

Simple DNS Plus
## 88 - kerberos-sec

Microsoft Windows Kerberos (server time: 2023-03-25 08:43:15Z)
## 135 - msrpc

Microsoft Windows RPC
## 139 - netbios-ssn

Microsoft Windows netbios-ssn
## 389 - ldap
  
  .......

  ````
  Then, when pasting, it would look like this:
  
  ![alt text](https://github.com/d4skor/nmap2markdown/blob/main/screenshot.jpg?raw=true)
