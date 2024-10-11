#!/bin/bash
# Установка Fish shell из стороннего репозитория
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
# Добавление ключа для репозитория Fish
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
# Обновление списка пакетов
sudo apt update
# Установка Fish shell
sudo apt install fish

# Подготовка AD клиента (Active Directory)
sudo apt install fly-admin-ad-sssd-client

# Установка Яндекс.Браузера
sudo apt install yandex-browser-stable

# Установка xRDP для удаленного доступа
sudo apt install xrdp

# Монтирование сетевого диска (Создание директории и монтирование с использованием сетевого имени пользователя)
mkdir /mnt/network_disk
mount -o username=inform1 //law/base/Distrib /mnt/network_disk

# Установка Kaspersky из .deb пакетов
# Установка Kaspersky Endpoint Security с сетевого диска
dpkg -i /mnt/network_disk/KESL11_11.3.0.7508\(ФСТЭК\)_643.46856491.00049-11/kesl/kesl_11.3.0-7508.cert_amd64.deb
wait  # Ожидание завершения установки

# Установка агента Kaspersky Network Agent
dpkg -i /mnt/network_disk/KESL11_11.3.0.7508\(ФСТЭК\)_643.46856491.00049-11/klnagent/klnagent64_14.0.0-4646_amd64.deb
wait  # Ожидание завершения установки

# Выполнение постинсталляционных скриптов Kaspersky
/opt/kaspersky/kesl/bin/kesl-setup.pl  # Настройка Kaspersky Endpoint Security
wait  # Ожидание завершения скрипта

/opt/kaspersky/klnagent64/lib/bin/setup/postinstall.pl  # Настройка Network Agent
wait  # Ожидание завершения скрипта
