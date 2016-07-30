CREATE USER 'pasteque'@'localhost' IDENTIFIED BY 'pasteque';
CREATE USER 'replication'@'10.8.0.1' IDENTIFIED BY 'replication';
GRANT REPLICATION SLAVE ON *.* TO 'replication'@'10.8.0.1';
CREATE USER 'pasteque'@'{{ hostvars['pasteque-web']['ansible_eth0']['ipv4']['address'] }}' IDENTIFIED BY 'pasteque';
GRANT ALL PRIVILEGES ON pasteque . * TO 'pasteque'@'localhost';
GRANT ALL PRIVILEGES ON pasteque . * TO 'pasteque'@'{{ hostvars['pasteque-web']['ansible_eth0']['ipv4']['address'] }}';
CREATE SCHEMA `pasteque` DEFAULT CHARACTER SET utf8;
