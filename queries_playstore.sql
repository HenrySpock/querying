-- Comments in SQL Start with dash-dash --
1.
playstore=# SELECT app_name FROM analytics WHERE id = 1880;
        app_name
-------------------------
 Web Browser for Android
(1 row)

2.
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';
(275 rows)

3.
SELECT category, COUNT(category) FROM analytics GROUP BY category ORDER BY category;
(33 rows)

4.
playstore=# SELECT app_name, rating, reviews FROM analytics WHERE rating IS NOT NULL ORDER BY rating DESC, reviews DESC LIMIT 5;
              app_name              | rating | reviews
------------------------------------+--------+---------
 DT-VR                              |      5 |     141
 CX-OF                              |      5 |     104
 Dr. Splorchy Presents Space Heroes |      5 |     103
 Learn R Language Easy Way          |      5 |     100
 Live DV                            |      5 |      90
(5 rows)
(I set up the query this way to indicate that 5 star ratings with more reviews were more heavily weigted.)

5.
*Tehcnically* this would get the correct answer, just modifying the previous statement: 
playstore=# SELECT app_name, rating, reviews FROM analytics WHERE rating IS NOT NULL ORDER BY rating DESC, reviews DESC LIMIT 1;
 app_name | rating | reviews
----------+--------+---------
 DT-VR    |      5 |     141
(1 row)

But that doesn't include the proper search parameters:
playstore=# SELECT app_name, reviews, rating FROM analytics WHERE rating >= 4.8 LIMIT 1;
  app_name  | reviews | rating
------------+---------+--------
 Chess Free | 4559407 |    4.8
(1 row)

6.
SELECT AVG(rating) AS rating_avg, category FROM analytics GROUP BY category ORDER BY rating_avg desc;

7. 
playstore=# SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;
      app_name      | price  | rating
--------------------+--------+--------
 Naruto & Boruto FR | 379.99 |    2.9
(1 row)

8.
playstore=# SELECT app_name, rating FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;

9.
playstore=# SELECT app_name FROM analytics WHERE rating < 3 AND reviews > 10000;
                    app_name
-------------------------------------------------
 The Wall Street Journal: Business & Market News
 Vikings: an Archer’s Journey
 Shoot Em Down Free
(3 rows)

10.
playstore=# SELECT app_name, reviews, price  FROM analytics WHERE price BETWEEN .10 AND 1 ORDER BY reviews DESC LIMIT 10;
                  app_name                   | reviews | price
---------------------------------------------+---------+-------
 Free Slideshow Maker & Video Editor         |  408292 |  0.99
 Couple - Relationship App                   |   85468 |  0.99
 Anime X Wallpaper                           |   84114 |  0.99
 Dance On Mobile                             |   61264 |  0.99
 Marvel Unlimited                            |   58617 |  0.99
 FastMeet: Chat, Dating, Love                |   58614 |  0.99
 IHG®: Hotel Deals & Rewards                 |   48754 |  0.99
 Live Weather & Daily Local Weather Forecast |   38419 |  0.99
 DreamMapper                                 |   32496 |  0.99
 Můj T-Mobile Business                       |   32344 |  0.99
(10 rows)

11. 
playstore=# SELECT app_name, last_updated FROM analytics ORDER BY last_updated ASC limit 1;
  app_name  | last_updated
------------+--------------
 CP Clicker | 2010-05-21
(1 row)

12.
playstore=# SELECT app_name, price FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);
      app_name      | price
--------------------+-------
 Cardi B Piano Game |   400
(1 row)

13.
playstore=# SELECT SUM(reviews) FROM analytics;
    sum
------------
 4814575866
(1 row)

14.
playstore=# SELECT category, COUNT(category) AS apps FROM analytics GROUP BY category HAVING COUNT(category) > 300 ORDER BY apps DESC;
    category     | apps
-----------------+------
 FAMILY          | 1789
 GAME            | 1110
 TOOLS           |  753
 PRODUCTIVITY    |  360
 MEDICAL         |  350
 COMMUNICATION   |  342
 SPORTS          |  338
 FINANCE         |  331
 PERSONALIZATION |  329
 LIFESTYLE       |  319
 BUSINESS        |  313
 PHOTOGRAPHY     |  313
(12 rows)

15.
playstore=# SELECT app_name, reviews AS num_of_reviews, min_installs AS num_of_installs, min_installs / reviews AS proportion
playstore-# FROM analytics WHERE min_installs >= 100000 ORDER BY proportion DESC LIMIT 1;
     app_name     | num_of_reviews | num_of_installs | proportion
------------------+----------------+-----------------+------------
 Kim Bu Youtuber? |             66 |        10000000 |     151515
(1 row)
