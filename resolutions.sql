CREATE TABLE resolutions(
	tweet_created TIMESTAMP,
	tweet_text VARCHAR,
	tweet_category VARCHAR,
	tweet_topics VARCHAR,
	tweet_location VARCHAR,
	tweet_state VARCHAR,
	tweet_region VARCHAR,
	user_timezone VARCHAR,
	user_gender VARCHAR,
	retweet_count INT
);

DROP TABLE resolutions;

SELECT * FROM resolutions;

SELECT tweet_category, COUNT(tweet_category) AS "lowest resolution"
FROM resolutions
GROUP BY tweet_category
ORDER BY "lowest resolution"
;

SELECT tweet_category, COUNT(tweet_category) AS "top resolution"
INTO resolution_category
FROM resolutions
GROUP BY tweet_category
ORDER BY "top resolution" DESC
;

SELECT * FROM resolution_category;

SELECT tweet_category, COUNT(tweet_category) AS "least retweets"
INTO tweet_count
FROM resolutions
WHERE retweet_count >= 1 
GROUP BY tweet_category
ORDER BY "least retweets";

SELECT date_trunc('hour',tweet_created), COUNT(date_trunc('hour',tweet_created)) AS "popular times"
INTO times
FROM resolutions
GROUP BY date_trunc('hour',tweet_created)
ORDER BY "popular times" DESC;

SELECT * FROM times;

DROP TABLE times;
ORDER BY "popular times" DESC;

SELECT tweet_state, COUNT(tweet_state) AS "States"
INTO state_count
FROM resolutions
GROUP BY tweet_state
ORDER BY "States" DESC;

