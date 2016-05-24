CREATE USER 'pasteque'@'localhost' IDENTIFIED BY 'pasteque';
CREATE USER 'pasteque'@'{{ hostvars['pasteque-web']['ansible_eth0']['ipv4']['address'] }}' IDENTIFIED BY 'pasteque';
GRANT ALL PRIVILEGES ON pasteque . * TO 'pasteque'@'localhost';
GRANT ALL PRIVILEGES ON pasteque . * TO 'pasteque'@'{{ hostvars['pasteque-web']['ansible_eth0']['ipv4']['address'] }}';
CREATE DATABASE IF NOT EXISTS pasteque;
