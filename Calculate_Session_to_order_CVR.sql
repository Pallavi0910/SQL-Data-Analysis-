use mavenfuzzyfactory;
/*
Sounds like gsearch nonbrand is are major traffic sales, but we need to anlayze of those sessions
are driving sales. 
Calculat the conversion rate sessions to orders to get better insight. We will need CVR of atleast 4%.
If we are much lower we need to reduce bids and if we are higher we can increase bids to drive more volume.
*/


SELECT 
    COUNT(DISTINCT a.website_session_id) AS number_of_sessions,
    COUNT(b.order_id) AS number_of_orders,
    COUNT(b.order_id) / COUNT(DISTINCT a.website_session_id) AS session_to_order_conv_rt,
    a.utm_source,
    a.utm_campaign,
    a.http_referer
FROM
    website_sessions a
        LEFT JOIN
    orders b ON a.website_session_id = b.website_session_id
WHERE
    a.created_at < '2012-04-14'
GROUP BY a.utm_source , a.utm_campaign , a.http_referer
ORDER BY number_of_sessions DESC;


/* Based on the analysis we need to dial down the search bids a bit.
We are overspending based on the conversion rate.
*/


