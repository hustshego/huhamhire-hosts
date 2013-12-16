CREATE TABLE IF NOT EXISTS t_domain (
  id UNSIGNED INTEGER PRIMARY KEY NOT NULL, 
  name VARCHAR(255) NOT NULL,
  stat UNSIGNED TINYINT NOT NULL
);

CREATE TABLE IF NOT EXISTS t_ip (
  id UNSIGNED INTEGER PRIMARY KEY NOT NULL, 
  ip VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS t_domain_ip (
  domain_id UNSIGNED INTEGER NOT NULL,
  ip_id UNSIGNED INTEGER NOT NULL,
  FOREIGN KEY (domain_id) REFERENCES t_domain(id),
  FOREIGN KEY (ip_id) REFERENCES t_ip(id),
  PRIMARY KEY (domain_id, ip_id)
);
  
CREATE TABLE IF NOT EXISTS t_pingTest (
  ip_id UNSIGNED INTEGER PRIMARY KEY NOT NULL,  
  min_delay FLOAT,
  max_delay FLOAT,
  avg_delay FLOAT,
  ratio FLOAT,
  test_count UNSIGNED TINYINT,
  FOREIGN KEY (ip_id) REFERENCES t_ip(id)
);