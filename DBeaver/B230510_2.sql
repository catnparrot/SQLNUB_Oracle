CREATE DATABASE kamebook;

CREATE USER ansan@localhost identified BY 'ansan';

GRANT ALL PRIVILEGES ON kamebook.* TO ansan@localhost;