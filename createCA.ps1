$caKey="ca.key"
$caCrt="ca.crt"
$caKeySize=4096
$caValidDays=365*5

if (-not(Test-Path -Path $caKey -PathType Leaf)) {
    openssl genrsa -out $caKey $caKeySize
}

if (-not(Test-Path -Path $caCrt -PathType Leaf)) {
    openssl req -x509 -new -nodes -key $caKey -sha256 -days $caValidDays -out $caCrt -config ca.conf
}
