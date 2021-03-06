USE ticket_1;

-- if sales results in FEB 2020 are than better resuls in FEB 2019 I would like to dril it by resellers and event types

SELECT date_format(date,'%b-%y') as sales_date,
		r.name as reseller,
        et.ticket_name as event,
        count(et.ticket_name) as event_sold
FROM ticket t
JOIN reseller r USING ( reseller_id)
JOIN event_type et USING (ticket_type_id)
WHERE YEAR(t.date) in (2020,2021)
	  AND MONTH(t.date) = 2
GROUP BY sales_date;

-- comparision if the commission rate is in relation to sales results 
SELECT 
	et.commission_rate,
    et.ticket_name,
    count(et.ticket_name) as ticket_freq
FROM ticket t
JOIN Event_type et USING(ticket_type_id)
GROUP BY et.commission_rate
ORDER BY ticket_freq DESC;

-- most popular ticket per offices, resellers
SELECT 
	et.Ticket_name, 
	count(et.Ticket_name) as Ticket_freq, 
	vo.Name as organizer_office, 
	r.Name as reseller
FROM ticket t 
JOIN venue_organizers vo USING(venue_organizers_id)
JOIN reseller r USING(reseller_id)
JOIN event_type et USING(ticket_type_id)
GROUP BY t.ticket_type_id
ORDER BY Ticket_freq DESC

