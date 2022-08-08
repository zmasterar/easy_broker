# README

## Prerequisites

The setups steps expect following tools installed on the system.

- Ruby 3.1.0
- Rails 7.0.3

### 1. Clone the repository

```bash
git clone git@github.com:zmasterar/easy_broker.git
```

And `cd` into the directory

```bash
cd easy_broker
```

### 2. Add the EasyBroker API key

```ruby
bundle exec rails credentials:edit
```
Add a line with a `easy_broker_api_key` key like this:

```ruby
easy_broker_api_key: your_valid_easy_broker_api_key
```

### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

## Website screenshot samples

Here are some screenshots of the site

<details>
<summary>Main Page</summary>
<img src="https://i.imgur.com/QuqWYZO.png" alt="Main Page" />
</details>

<details>
<summary>Property page and contact form</summary>
<img alt="Property page and contact form" src="https://i.imgur.com/9UlJT11.png" />
</details>

<details>
<summary>Contact form submitted correctly</summary>
<img alt="Contact form submitted correctly" src="https://i.imgur.com/oXu7U0k.png" />
</details>

<details>
<summary>Contact form submitted with errors</summary>
<img alt="Contact form submitted with errors" src="https://i.imgur.com/RZqh6N0.png" />
</details>

## Notes

As the design wasn't this project focus, I decided to add Bootstrap via its CDN and added some basic styling with it.

I also made a really basic previous and next buttons in the main page, but I think it's better to use a more robust way to do it. I decided to use [Pagy](https://github.com/ddnexus/pagy) as an alternative and pushed it to the `pagy` branch.

I think my code could improve in the abstraction of the class used to connect with the EasyBroker API, and have a better structure for better scalability (make different classes for each endpoint, for example).

The hardest thing for me when building websites is when it comes to testing, not as much in the _how_ but in the _what_ to test, so that's something I look forwards to improve.
