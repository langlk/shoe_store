# Shoe Store

#### _Epicodus Project in Ruby and ActiveRecord, September 29, 2017_

#### By Kelsey Langlois

## Description

_A Ruby Web App for managing a shoe store. A user can save stores and brands, and assign brands to stores (a brand can be assigned to multiple stores, and a store can stock multiple brands)._

## Setup/Installation Requirements

* Clone this repository
* Ensure you have Postgres installed and running ([instructions here](https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef))
* To set up the development database, run the following commands in the project's root directory:
  * ```bundle install```
  * ```rake db:create```
  * ```rake db:environment:set```
  * ```rake db:migrate```
* After the development database is set up, run ```ruby app.rb``` in the project's root directory
* Open ```localhost:4567``` in your web browser

## Specifications

* Store names must be unique, non-empty, and 100 characters maximum.
* Brand names must be unique, non-empty, and 100 characters maximum.
* Stores can stock many brands, and brands can be stocked by many stores.
* A brand's price will default to $0.00 if it is not provided.

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Sinatra
* Postgres
* ActiveRecord

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*
