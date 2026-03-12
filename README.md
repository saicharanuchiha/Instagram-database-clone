# 📸 Instagram Clone Data Analysis (SQL)

## 📌 Objective
To analyze user engagement, track platform growth, and identify potential bot activity within a simulated social media database.

## 🗄️ Database Schema
The relational database consists of 7 tables: `users`, `photos`, `comments`, `likes`, `follows`, `tags`, and `photo_tags`.

![Instagram Database ERD](IG_clone.png)

## 📊 Key Business Problems Solved
* **Platform Growth (Registration Trends):** Extracted date metrics using the `DAYNAME()` function and aggregations to determine the most popular day of the week for new account registrations.
* **Content Virality (Most Liked Photo):** Executed multi-table `JOIN` operations (linking `users`, `photos`, and `likes`) to identify the single most popular photo on the platform and its creator.
* **User Engagement (Average Posts):** Utilized scalar subqueries to mathematically calculate the global average of photos published per user across the entire network.
* **Targeted Marketing (Top Hashtags):** Leveraged `INNER JOIN` logic to find the top 5 most frequently used hashtags, automatically filtering out unused tags for accurate ad targeting.
* **Retention Strategies (Inactive Users):** Applied `LEFT JOIN` and `IS NULL` filtering to isolate and count users who have registered but never posted a photo.
* **Bot Detection (Suspicious Activity):** Built a complex query utilizing `HAVING` and subqueries to identify accounts that have liked every single photo on the platform (flagged as potential bots).

## 📁 Files in this Repository
* **Scripts/instagram_analysis.sql**: Contains the complete, optimized code for all 7 business queries.
