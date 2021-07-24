## Aknowledgments
This gem is based on the previos work done in https://github.com/maxmetcalf12/tailwind_form, which bases elements' class customization on PostCSS. Depending on the [configuration](#configuration) you have in your Rails app, it can be tricky to have PostCSS plugins work, which in turn are needed for the origina approach to work. 
# TailwindForm
`tailwind_form` is a Rails form builder to easily implement custom, consistent TailwindCSS forms into your Rails app. 

This gem sets common form elements' classes with a simple configuration file. 

This gem is assuming you have [TailwindCSS](https://github.com/tailwindcss/tailwindcss) and [TailwindCSS Custom Forms](https://github.com/tailwindcss/custom-forms) already installed on your rails application.

Benefits of `tailwind_form`
* Makes implementing forms much more simple, thus slimming your `.erb` files
* Makes forms more consistent across your entire website by forcing extraction of form classes
* Reduces errors
* Makes `.erb` forms much more readable

This gem is largely based on the [Bootstrap Form Gem](https://github.com/bootstrap-ruby/bootstrap_form), but implemented for TailwindCSS.

## Requirements

Tested with:
* Rails 6.1.3.1
* Tailwind 2.0.4

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tailwind_form', git: 'https://github.com/bgvo/tailwind_form'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tailwind_form

## Usage

Here is an example of the form:

```erb
<%= tailwind_form_with(model: @person, local: true) do |form| %>
  <%= form.form_group :first_name %>
  <%= form.form_group :last_name %>
  <%= form.form_group :email, :email_field %>

  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>

```

Which generates the following form:

```html
<form action="/people" accept-charset="UTF-8" method="post">
  <input type="hidden" name="authenticity_token" value="cfuds;" />
  <div class="form-group-class-1 form-group-class-2">
    <label class="form-label-class-1 form-label-class-2" for="person_first_name">First name</label>
    <div class="form-input-group-class-1">
      <input type="text" name="person[first_name]" id="person_first_name" />
    </div>
  </div>
  <div class="form-group-class-1 form-group-class-2">
    <label class="form-label-class-1 form-label-class-2" for="person_last_name">Last name</label>
    <div class="form-input-group-class-1">
      <input type="text" name="person[last_name]" id="person_last_name" />
    </div>
  </div>
  <div class="form-group-class-1 form-group-class-2">
    <label class="form-label-class-1 form-label-class-2" for="person_email">Email</label>
    <div class="form-input-group-class-1">
      <input type="email" name="person[email]" id="person_email" />
    </div>
  </div>

  <div class="actions">
    <input type="submit" name="commit" value="Create Person" data-disable-with="Create Person" />
  </div>
</form>
```

## Configuration

Add `tailwind_form.rb` to `config/initializers`:

```ruby
TailwindForm.configure do |config|
  config.form_label_classes = "form-label-class-1 form-label-class-2"
  config.form_group_classes = "form-group-class-1 form-group-class-2"
  config.form_input_group_classes = "form-input-group-class-1 form-input-group-class-2"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## To do

So far, we have implemented the basic form but only have `text_field`, `text_area`, `email_field` and `time_zone_select`. Next steps are implementing all of the other input types.

Additionally, here are other items on the todo list:
* Add class configuration support for different form elements: text fields, checkboxes, radio buttons, etc.
* Add support for errors, both as an alert and as inline error helper
* Add different layout options
* Add different options for select and multiselect using AlpineJS

If anyone happens to be seeing/using this gem and can think of other features, please let me know!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bgvo/tailwind_form. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/maxmetcalf12/tailwind_form/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TailwindForm project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/maxmetcalf12/tailwind_form/blob/master/CODE_OF_CONDUCT.md).
