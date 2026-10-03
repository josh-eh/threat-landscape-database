-- Query to identify high-risk threat actors who aggressively reuse infrastructure 
-- across multiple campaigns, helping triage priorities for senior management.
WITH ActorInfraMetrics AS (
    SELECT 
        ta.actor_name,
        COUNT(DISTINCT ci.infra_id) AS total_domains_deployed,
        COUNT(DISTINCT tw.wallet_id) AS total_monitored_wallets,
        COALESCE(SUM(tw.total_estimated_stolen_usd), 0) AS total_impact_usd
    FROM threat_actors ta
    LEFT JOIN c2_infrastructure ci ON ta.actor_id = ci.actor_id
    LEFT JOIN tracked_wallets tw ta.actor_id = tw.actor_id
    GROUP BY ta.actor_name
)
SELECT 
    actor_name,
    total_domains_deployed,
    total_monitored_wallets,
    total_impact_usd,
    CASE 
        WHEN total_impact_usd > 1000000 THEN 'CRITICAL TIER 1'
        WHEN total_domains_deployed > 5 THEN 'HIGH TIER 2'
        ELSE 'MEDIUM TIER 3'
    END AS tactical_triage_priority
FROM ActorInfraMetrics
ORDER BY total_impact_usd DESC;

