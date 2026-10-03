-- Track Threat Actor Groups (e.g., Lazarus, CryptoDrainCollective)
CREATE TABLE threat_actors (
    actor_id SERIAL PRIMARY KEY,
    actor_name VARCHAR(100) NOT NULL UNIQUE,
    origin_country VARCHAR(50),
    first_observed DATE DEFAULT CURRENT_DATE
);

-- Track malicious infrastructure associated with actors
CREATE TABLE c2_infrastructure (
    infra_id SERIAL PRIMARY KEY,
    domain_or_ip VARCHAR(255) NOT NULL UNIQUE,
    actor_id INT REFERENCES threat_actors(actor_id) ON DELETE CASCADE,
    is_active BOOLEAN DEFAULT TRUE,
    last_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Track specific crypto assets used in extortion or drainer infrastructure
CREATE TABLE tracked_wallets (
    wallet_id SERIAL PRIMARY KEY,
    blockchain VARCHAR(50) NOT NULL,
    wallet_address VARCHAR(128) NOT NULL UNIQUE,
    actor_id INT REFERENCES threat_actors(actor_id) ON DELETE SET NULL,
    total_estimated_stolen_usd NUMERIC(15, 2) DEFAULT 0.00
);
