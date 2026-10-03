-- ============================================================================
-- THREAT LANDSCAPE SEED DATA
-- Purpose: Populates the schema with realistic, high-fidelity Web3 threat data.
-- ============================================================================

-- 1. Populate Threat Actor Profiles
INSERT INTO threat_actors (actor_id, actor_name, origin_country, first_observed) VALUES
(1, 'Lazarus Group (APT38)', 'North Korea', '2016-03-15'),
(2, 'InfernoDrainer-SubGroup', 'Unknown', '2023-05-10'),
(3, 'Scattered Spider (Crypto-Vertical)', 'Multi-National', '2022-11-01');

-- 2. Populate Malicious Command-and-Control (C2) Infrastructure
INSERT INTO c2_infrastructure (infra_id, domain_or_ip, actor_id, is_active) VALUES
(1, 'coinbase-security-sync.com', 1, TRUE),
(2, 'api.crypto-holder-verification.net', 1, TRUE),
(3, 'metamask-update-gate.io', 2, FALSE), -- Historically used, currently offline
(4, 'wallet-connect-drainer.biz', 2, TRUE),
(5, 'okx-login-portal.com', 3, TRUE);

-- 3. Populate Tracked Malicious Cryptocurrency Assets & Attributed Theft
INSERT INTO tracked_wallets (wallet_id, blockchain, wallet_address, actor_id, total_estimated_stolen_usd) VALUES
(1, 'Ethereum', '0x71C7656EC7ab88b098defB751B7401B5f6d8976F', 1, 45000000.00),
(2, 'Solana', 'Hw7Yv3uX8m8v2NqZ1aB3c4d5e6f7g8h9i0jK', 1, 12300000.00),
(3, 'Ethereum', '0x9965503B1a0592197f6a89defB751B7401B5f6d8', 2, 4200000.50),
(4, 'Bitcoin', 'bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', 3, 850000.00);

