-- ============================================================================
-- ACTIVE CAMPAIGN SURVEILLANCE QUERY
-- Purpose: Correlates live C2 infrastructure with monitored wallet assets.
-- Objective: Provides the SOC with an instantaneous tactical prioritization view.
-- ============================================================================

SELECT 
    ta.actor_name AS threat_actor,
    ta.origin_country AS suspected_attribution,
    ci.domain_or_ip AS active_c2_domain,
    tw.blockchain,
    tw.wallet_address AS exfiltration_wallet,
    tw.total_estimated_stolen_usd AS known_financial_footprint
FROM threat_actors ta
INNER JOIN c2_infrastructure ci 
    ON ta.actor_id = ci.actor_id
INNER JOIN tracked_wallets tw 
    ON ta.actor_id = tw.actor_id
WHERE ci.is_active = TRUE
ORDER BY tw.total_estimated_stolen_usd DESC;

