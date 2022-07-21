$keyFile="server.key"
$csrFile="server.csr"
$crtFile="server.crt"
$config="sample.conf"
$caKey="ca.key"
$caCrt="ca.crt"

$keySize=4096
$validDays=365

if (-not(Test-Path -Path $keyFile -PathType Leaf)) {
    openssl genrsa -out $keyFile $keySize
}

if (-not(Test-Path -Path $csrFile -PathType Leaf)) {
    openssl req -new -sha256 -key $keyFile -out $csrFile -config $config 
    openssl req -in $csrFile -text -noout
}

if (-not(Test-Path -Path $crtFile -PathType Leaf)) {
    openssl x509 -req -in $csrFile -CA $caCrt -CAkey $caKey -CAcreateserial -out $crtFile -days $validDays -extfile $config -extensions req_ext
}