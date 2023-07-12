use music_store

# Q1. Who is the senior most employee based on job title?
select *from employee
order by levels desc
limit 1;

# Q2. Which countries have the most Invoices?
select count(*), billing_country from invoice
group by billing_country
order by  billing_country desc
limit 1;

# Q3. What are top 3 values of total invoice?
Select total from invoice
order by total desc
limit 3;

# Q4. Which city has the best customers? We will throw a promotional Music Festival in the city we made most money.
# Write a query that returns one city that has the highest sum of invoice totals. 
# Return both the city name & sum of all invoice totals.
Select sum(total) as total_value, billing_city from invoice
group by billing_city
order by total_value desc
limit 1;

# Q5. Who is the best customer? The customer who has spent the most money will be declared the best customer.
# Write a query that returns the person who has spent the most money.
select concat(c.first_name, " - ",c.last_name) as customer_name, sum(I.total) as total_paid from customer as c inner join invoice as I
on I.customer_id = c.customer_id
group by customer_name
order by total_paid desc;

# Q6. Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
# Return your list ordered alphabetically by email starting with A.
select first_name, last_name, email from customer 
inner join invoice on customer.customer_id = invoice.customer_id
inner join invoice_line on invoice.invoice_id = invoice_line.invoice_id
inner join track on invoice_line.track_id = track.track_id
inner join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock'
order by email asc;


# Q7. Let's invite the artists who have written the most rock music in our dataset. 
# Write a query that returns the Artist name and total track count of the top 10 rock bands
select artist.name, count(artist.artist_id) as number_of_song from track
inner join album on album.album_id = track.album_id
inner join artist on artist.artist_id = album.artist_id
inner join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.name
order by number_of_song desc
limit 10;


# Q8. Return all the track names that have a song length longer than the average song length.
# Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.
Select track.name, track.milliseconds from track
where milliseconds > (select avg(milliseconds) from track)
order by milliseconds desc;


# Q9. Find how much amount spent by each customer on artists?
# Write a query to return customer name, artist name and total spent.
select concat(customer.first_name, "   ", customer.last_name), artist.name, sum(customer.total) as total_paid from customer
group by customer.first_name;



# Q10. We want to find out the most popular music Genre for each country.
# We determine the most popular genre as the genre with the highest amount of purchases.
# Write a query that returns each country along with the top Genre.
# For countries where the maximum number of purchases is shared return all Genres


# Q11. Write a query that determines the customer that has spent the most on music for each country.
# Write a query that returns the country along with the top customer and how much they spent.
# For countries where the top amount spent is shared, provide all customers who spent this amount.
 