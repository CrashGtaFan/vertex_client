# VertexClient

The Vertex Client Ruby Gem provides an interface to integrate with Vertex Cloud's REST API.

## Usage

### Quotation

```ruby
response = VertexClient.quotation(
  # The top level transaction date for all line items.
  date: '2018-11-15',
  # Overall discount amount for the total price of the quotation.
  discount: "5.40",
  # The top level customer for all line items.
  customer: {
    code: "inky@customink.com",
    address_1: "11 Wall Street",
    address_2: "#300",
    city: "New York",
    state: "NY",
    postal_code: '10005'
  },
  # The top level seller for all line items.
  seller: {
    company: "CustomInk"
  },
  line_items: [
    {
      product_code: "t-shirts",
      quantity: 7,
      price: "35.50",
    },
    {
      product_code: "t-shirts",
      quantity: 4,
      price: "25.40",
      # Optional transaction date override for a line item.
      date: '2018-11-14',
      # Optional discount amount for an individual line item.
      discount: "2.23",
      # Optional seller override for a line item.
      seller: {
        company: "Custom Ink Stores"
      },
      # Optional customer override for a line item.
      customer: {
        code: "prez@customink.com",
        address_1: "1600 Pennsylvania Ave NW",
        city: "Washington",
        state: "DC",
        postal_code: '20500'
      }
    }
  ]
)

response.total_tax #=> Total tax amount
response.total     #=> Total price plus total tax
reponse.subtotal   #=> Total price before tax
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vertex_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vertex_client

## Configuration

Configure the client's connection to Vertex using environment variables or an initializer.

### Environment Variables

```
VERTEX_TRUSTED_ID=your-trusted-id
VERTEX_SOAP_API=https://vertex-soap-api.com
```
### Initializer

```ruby
VertexClient.configure do |config|
  config.trusted_id = 'your-trusted-id'
  config.soap_api = 'https://vertex-soap-api.com'
end
```

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/a-maas/vertex_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the VertexClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/a-maas/vertex_client/blob/master/CODE_OF_CONDUCT.md).

## Setup

This project supports our [Strap conventions][strap]. After cloning the app, 
run the following:

    bin/bootstrap
    bin/setup
    bin/test

After pulling down changes, run the following:

    bin/update

[strap]: https://github.com/customink/strap
