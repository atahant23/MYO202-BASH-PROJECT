#!/bin/bash

# Atahan Turna
# 2420191030
# Siber Güvenlikte Linux İşletim Sistemleri Sertifikası : https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=0Koh8ej8B7
# Docker Temelleri Sertifiksı: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=rKjhardPrM
# Linux Bash Sertifikası 3: https://credsverse.com/credentials/13693ae2-f036-49a6-8613-164d421b770e

date -Iseconds > report.log


if [ "$(uname)" == "Darwin" ]; then
    echo "--- MAC SISTEM BILGILERI ---" >> report.log
    system_profiler SPHardwareDataType >> report.log
    
    echo "--- AG VE DISK DETAYLARI ---" >> report.log
    ifconfig >> report.log
    diskutil info / >> report.log
else
    echo "--- WINDOWS SISTEM DETAYLARI ---" >> report.log
    wmic cpu get name >> report.log
    wmic computersystem get totalphysicalmemory >> report.log
    wmic baseboard get product >> report.log
    wmic diskdrive get serialnumber >> report.log
    getmac >> report.log
fi

echo "Sifre Giriniz : "
read PAROLA

gpg --batch --yes --passphrase "$PAROLA" --cipher-algo AES256 -c report.log

rm report.log

echo "Islem bitti."
