# README

## What problem does this app solve. 

I have created this app as a way to connect buyers and sellers of customised freestanding cabinets. 

The app streamlines the negotiation process between cabinet makers and customers, by allowing makers to post suggested cabinet configurations, which they are able to make, and for customers to view, and customise to their needs, before placing an order with the makers. 

## Why is this problems worth solving?

Customised furniture is a good way to get the most from a space. There is an established industry around kitchen and wardrobe design, manufacture and installation in Australia. Consumers could benefit from customisable freestanding furniture items in the same way in which they benefit from having a kitchen designed to fit their specific needs. The problem so far has been that the overhead for liasing, educating, designing, and negotiating custom projects becomes too large for smaller projects like a single piece of furniture, such that the final cost and price for such pieces becomes too high. This app aims to lower some of these overheads by creating a way for makers to present the scope of their capacity directly to consumers, and also offers a way for consumers to specify their customisations through an automated process that cuts down on time and therefore cost for everyone involved. 

Link to deployed app

https://infinite-plateau-43902.herokuapp.com/

Link to GitHub repository 

https://github.com/Kyle46220/UdouSiteProject


## Description 

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

<img src="docs/UDOU sitemap"
     style="float: left; margin-right: 10px;" />

##insert screen shots here##

The target audience here is: on the one side, consumers looking for custom furniture; and on the other side makers of custom cabinets. 

## Tech Stack

The application is built with ruby on rails, displayed using HTML generated with embedded ruby and styled using SCSS, using a PostgreSQL database, and deployed on Heroku. 

## User stories 

As a consumer looking to buy a customised cabinet, a user can create an account, specify that they are a customer and log on the the website, they will be presented with an index of collections representing different standard cabinet configurations, from which they are able to select options to edit, save and purchase the configuration that best suits their needs. 

As a maker looking to post suggested cabinet configurations for customers to browse, a user can create an account and log on to the website and specify that they are a maker. They will be presented with an index of collections containing cabinet configurations posted by other makers which they can view, and also they can create new configurations to display to customers, which they can edit later as well if need be. 

## Wireframe 

The website uses a simple layout with a small top nav bar with info about logged in user, cart, and logout; a larger nav bar below this with site navigation. 

<img src="docs/UDOU wireframe"
     style="float: left; margin-right: 10px;" />

## ERD

The Entity Relationship Diagram for this application can be found by following this link - 

https://drive.google.com/file/d/1tIh9UzXT0HMd5WXjlHdw8PPExFeYKzxD/view?usp=sharing

<img src="docs/UDOU ERD.jpeg"
     style="float: left; margin-right: 10px;" />

## High-level components 

This application uses the rails module 'Active Record' to map the SQL database entities to ruby objects for use in the application code. This module creates simplification in the application code by transforming the more complex SQL commands used to query the database into simpler ruby syntax. 

The application also uses the form_with rails helper module to simplify the generation of HTML forms. HTML form syntax can be generated from the variables specified in rails which are mapped to database relations by active record. This allows the creation of dynamic form templates which automatically generate the specific form syntax for the HTTP request that is needing to be made. 

## Project models 

The application has multiple models. Authentication is provided by the Devise gem which creates model of a users table containing passwords and emails of users. 

Each Devise user, has one and only one profile model, which contains other information about the user's profile, such as their name, and whether they are a buyer or seller. Profiles have many collections, which are just a category name, and a designation of publicly or privately viewable, and which in turn contain many cabinet configurations (cab_config), or listings. Each profile will also have many carts, which are created every time a purchase link has been clicked, and which has many cart_items which belong to and reference both a cab_config and a cart. 

As well each cab_config is able to have one image upload. 


## Database Relations 

This appliciation has 8 tables

The first is a table of Users, with the fields email, and password which are not allowed to be null, as they are referenced by other tables. There is also a primary key field containing an auto incrementing integer to act as a unique identifier for each specific table entry. All tables have these primary key fields, and created_at and updated_at datetime fields.  The second table called "Profiles" references the primary key of users by keeping this integer in its foreign key field, and has a field for name, which takes a string, and a field for user type, which takes a boolean status, as does the field for 'email opt in'.

For the rest of the tables I will only discuss the foreign keys. 

The collection table has a foreign key of the profile tables primary key to keep track of which collection belongs to which profile. 

The cab_configs table has two foreign key fields. One for the collection it belongs to and one for the profile which created it. 

There is a joining table called cart_items which keeps foreign key fields of cab_config primary keys and cart primary keys, to relate the cab_configs to the transactions that result from a cart.

## Database schema design

``` ruby
ActiveRecord::Schema.define(version: 2019_11_08_033054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cab_configs", force: :cascade do |t|
    t.float "height"
    t.float "width"
    t.float "depth"
    t.integer "style"
    t.integer "colour"
    t.integer "shelf_qty"
    t.integer "drawer_qty"
    t.integer "cupboard_qty"
    t.boolean "back_panel"
    t.bigint "profile_id"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price", default: 1
    t.index ["collection_id"], name: "index_cab_configs_on_collection_id"
    t.index ["profile_id"], name: "index_cab_configs_on_profile_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cab_config_id"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.bigint "order_id"
    t.index ["cab_config_id"], name: "index_cart_items_on_cab_config_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["order_id"], name: "index_cart_items_on_order_id"
  end

  create_table "carts", force: :cascade do |t|
    t.boolean "result_of_transaction"
    t.datetime "transaction_date"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_carts_on_profile_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public_display"
    t.index ["profile_id"], name: "index_collections_on_profile_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.integer "user_type"
    t.boolean "email_opt_in"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "title"
    t.text "description"
    t.text "image_upload"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_reviews_on_cart_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.text "image_upload"
    t.bigint "cab_config_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cab_config_id"], name: "index_uploads_on_cab_config_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cab_configs", "collections"
  add_foreign_key "cab_configs", "profiles"
  add_foreign_key "cart_items", "cab_configs"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "orders"
  add_foreign_key "carts", "profiles"
  add_foreign_key "collections", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "carts"
  add_foreign_key "uploads", "cab_configs"
end
```

The decision of which datatypes to use was informed by the requirments. 

All cabinet parameters specified in the cab_configs table had to be numeric, to make calculations possible. 

I stored some fields not storing information about a numeric quanity as integers anyway, such as :cab_config, :colour, so that I could make some enums in the model, to display a small amount of set options. 

I stored a few fields as booleans when they just needed to store a yes or no answer. This makes it easier keep the data sanitised. eg. :profiles, :email_opt_in; :cab_configs, :back_panel. 

I used strings or text for fields that were storing user input from words, if the input was going to be short, eg an email address, I would use string, otherwise text. 

For the price field, I used integer and stored the amount in cents. 

## Task Allocation and Tracking

I used a combination of trello, and pen and paper to track tasks. In trello I had a simple kanban set up of "To Do" , "Doing", and "Done", and I also had an abandoned task column called "Duds".  I would move cards between the columns as the tasks were completed. Broader tasks, like implementing a feature were given a card on trello, and then when I was working on that task I would plan out a list of smaller subtasks to be achieved over the next programming session with pen and paper. As I was learning as I went, some tasks turned out to be redundant or badly specifed so I moved them to the "Dud" trello board. And some things I ran out of time for, so they're still in the "to do" list. 

<img src="MarketplaceAppTrello1.jpeg"
     style="float: left; margin-right: 10px;" />

<img src="MarketplaceAppTrello2.jpeg"
     style="float: left; margin-right: 10px;" />

<img src="MarketplaceAppTrello3.jpeg"
     style="float: left; margin-right: 10px;" />














































