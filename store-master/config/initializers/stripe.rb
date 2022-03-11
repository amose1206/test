Rails.configuration.stripe = {
  :publishable_key => 'pk_test_U6Lqh53ULqfZhoNCvVuWMbqb',
  :secret_key      => 'sk_test_OojfD7JxDY83jqJEKnwk0cKG'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]