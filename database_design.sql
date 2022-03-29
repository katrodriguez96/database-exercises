# adlister database structure
CREATE TABLE users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email    VARCHAR(50)  NOT NULL,
    password VARCHAR(50)  NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id     INT UNSIGNED NOT NULL,
    title       VARCHAR(50)  NOT NULL,
    description VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE categories
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE ad_categories
(
    ad_id       INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

# queries
# for a given ad, what is the email of the user that created it?
SELECT email
FROM users
         JOIN ads AS a
              ON users.id = a.user_id
WHERE a.id = 1;
# just gonna use 1 as example ids for this

# for a given ad, what category, or categories, does it belong to?
SELECT category
FROM categories
         JOIN ad_categories AS ac
              ON categories.id = ac.category_id
WHERE ad_id = 1;

# for a given category, show all ads that are in that category
SELECT *
FROM ads
         JOIN ad_categories AS ac
              ON ads.id = ac.ad_id
WHERE category_id = 1;

# for a given user, show all the ads they've posted
SELECT *
FROM ads
        JOIN users AS u
            ON ads.user_id = u.id
WHERE u.id = 1;