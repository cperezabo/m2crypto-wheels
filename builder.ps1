$m2crypto_version = "0.35.2"
$openssl_path = "C:\openssl"

git clone -b "$m2crypto_version" https://gitlab.com/m2crypto/m2crypto.git; cd m2crypto

python setup.py build --openssl="$openssl_path" --bundledlls
python setup.py bdist_wheel