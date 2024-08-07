--Q1: Write query to return the email, first name, last name & genre of all Rock Music
--listeners. Return your list ordered alphabetically by email starting with A.

SELECT c.email, c.first_name, c.last_name
FROM customer c
JOIN invoice ON c.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)

ORDER BY email;

--Q2: Let's invite the artists who have written the most rock music in our dataset.
--Write a query that returns the Artist name and total track count of the top 1- rock bands.

SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON track.album_id = album.album_id
JOIN artist ON album.artist_id = artist.artist_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

--Q3: Return all the track names that have a song length longer than the average song
--length. Return the name and milliseconds for each track. Order by the song length with
--the longest songs listed first.

SELECT track.name, milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track
)
ORDER BY milliseconds DESC






