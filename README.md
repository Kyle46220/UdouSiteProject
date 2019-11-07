# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

What propblem does this app solve. 

I have created this app as a way to connect buyers and sellers of customised freestanding cabinets. 

The app streamlines the negotiation process between cabinet makers and customers, by allowing makers to post suggested cabinet configurations, which they are able to make, and for customers to view, and customise to their needs, before placing an order with the makers. 

WHy is this problems worth solving?

Customised furniture is a good way to get the most from a space. There is an established industry around kitchen and wardrobe design, manufacture and installation in Australia. Consumers could benefit from customisable freestanding furniture items in the same way in which they benefit from having a kitchen designed to fit their specific needs. The problem so far has been that the overhead for liasing, educating, designing, and negotiating custom projects becomes too large for smaller projects like a single piece of furniture, such that the final cost and price for such pieces becomes too high. This app aims to lower some of these overheads by creating a way for makers to present the scope of their capacity directly to consumers, and also offers a way for consumers to specify their customisations through an automated process that cuts down on time and therefore cost for everyone involved. 

A link (URL) to your deployed app (i.e. website)

##Put Link to Heroku here.##

A link to your GitHub repository (repo).

https://github.com/Kyle46220/UdouSiteProject


Description of your marketplace app (website), including:
- Purpose
- Functionality / features
- Sitemap
- Screenshots
- Target audience
- Tech stack (e.g. html, css, deployment platform, etc)

The purpose of this website is described above -  its a way for custom cabinet makers and customers to negotiate jobs. 

The main functionality of the website is to display collections of cabinet configurations to customers, which have been uploaded by cabinet makers. Each configuration will specify details about the cabinet config. Users of the website specify if they are customers or makers. Makers will be authorised to post new, delete and edit existing collections and configurations for public display. Customers will be authorised to save their own customised versions of the cabinets displayed publicly on the website, in their own personal collections which are viewable to them, and to makers, but not to other customers. 

Customers will be able to add their customised configurations to a cart for checkout and pay online through stripe. 

Customers will be able to upload a photo of the space they intend to put their cabinet into to send to the maker for reference. 

Future features to add include the option for customers to leave a review of their completed purchases. 

Site map for the website can be found by following this link - 

https://drive.google.com/file/d/19vhjmsfGbhHGUM8WGezS6GAR0ll1THZc/view?usp=sharing

##insert screen shots here##

The target audience here is: on the one side, consumers looking for custom furniture; and on the other side makers of custom cabinets. 

Tech Stack

The application is built with ruby on rails, displayed using HTML generated with embedded ruby and styled using SCSS, using a PostgreSQL database, and deployed on Heroku. 

User stories for your app

As a consumer looking to buy a customised cabinet, a user can create an account, specify that they are a customer and log on the the website, they will be presented with an index of collections representing different standard cabinet configurations, from which they are able to select options to edit, save and purchase the configuration that best suits their needs. 

As a maker looking to post suggested cabinet configurations for customers to browse, a user can create an account and log on to the website and specify that they are a maker. They will be presented with an index of collections containing cabinet configurations posted by other makers which they can view, and also they can create new configurations to display to customers, which they can edit later as well if need be. 

The Entity Relationship Diagram for this application can be found by following this link - 

https://drive.google.com/file/d/1tIh9UzXT0HMd5WXjlHdw8PPExFeYKzxD/view?usp=sharing

Explain the different high-level components (abstractions) in your app

This application uses the rails module 'Active Record' to map the SQL database entities to ruby objects for use in the application code. This module creates simplification in the application code by transforming the more complex SQL commands used to query the database into simpler ruby syntax. 

The application also uses the form_with rails helper module to simplify the generation of HTML forms. HTML form syntax can be generated from the variables specified in rails which are mapped to database relations by active record. This allows the creation of dynamic form templates which automatically generate the specific form syntax for the HTTP request that is needing to be made. 

Describe your projects models in terms of the relationships (active record associations) they have with each other.

The application has multiple models. Authentication is provided by the Devise gem which creates model of a users table containing passwords and emails of users. 

Each Devise user, has one and only one profile model, which contains other information about the user's profile, such as their name, and whether they are a buyer or seller. Profiles have many collections, which are just a category name, and a designation of publicly or privately viewable, and which in turn contain many cabinet configurations (cab_config), or listings. Each profile will also have many carts, which are created every time a purchase link has been clicked, and which has many cart_items which belong to and reference both a cab_config and a cart. 

As well each cab_config is able to have one image upload. 


Discuss the database relations to be implemented in your application. 

This appliciation has 8 tables

The first is a table of Users, with the fields email, and password which are not allowed to be null, as they are referenced by other tables. There is also a primary key field containing an auto incrementing integer to act as a unique identifier for each specific table entry. All tables have these primary key fields, and created_at and updated_at datetime fields.  The second table called "Profiles" references the primary key of users by keeping this integer in its foreign key field, and has a field for name, which takes a string, and a field for user type, which takes a boolean status, as does the field for 'email opt in'.

For the rest of the tables I will only discuss the foreign keys. 

The collection table has a foreign key of the profile tables primary key to keep track of which collection belongs to which profile. 

The cab_configs table has two foreign key fields. One for the collection it belongs to and one for the profile which created it. 

there is a joining table called cart_items which keeps foreign key fields of cab_config primary keys and cart primary keys, to relate the cab_configs to the transactions that result from a cart. 
































