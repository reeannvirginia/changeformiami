Rails.configuration.stripe = {
  :publishable_key => ENV.fetch('stripe_publishable_key'),
  :secret_key      => ENV.fetch('stripe_secret_key')
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
