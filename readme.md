# Poor mans CA

## ca

### create CA certificates

- create a ca.conf file
- place it in the same directory as the **createCA.ps1** script
- run the **createCA.ps1** script

you should have a **ca.key** and a **ca.crt** file next to your **ca.conf** file
if the files already exist they are used.

### ca cert config file

```config
[ req ]
default_bits = 4096
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C = DE
ST = Bavaria
L = Munich
O = MCS
OU = MCS Dev
CN = Test CA

[ req_ext ]
```

## SSL certs

- run **createCA.ps1** if not already done. we require the **ca.key** and **ca.crt** files
- create a **ssl.conf** file
- adapt the SAN if required
- place it in the same directory as the **createSSl.ps1** script
- run the **createSSL.ps1** script

you should have a **server.key**, **server.csr** and a **server.crt** file next to your **server.conf** file

### ssl cert config file

```config
[ req ]
default_bits = 4096
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C = DE
ST = Bavaria
L = Munich
O = MCS
OU = MCS Dev
CN = localhost

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = localhost
DNS.2 = testhost.local
DNS.3 = sslhost.local
IP.1 = 10.3.0.4
IP.2 = 10.3.0.5
```

## hints

as this is based on **openssl** refer to the openssl docs or use the search engine of your choice
