# adlister database structure
CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE ad_categories (
    ad_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);