$( document ).on('turbolinks:load', function() {
  var handler = Plaid.create({
    clientName: 'Plaid Walkthrough Demo',
    env: 'sandbox',
    key: 'e664451781cb7055250a18e5435e0e', // Replace with your public_key to test with live credentials
    product: ['transactions'],
    webhook: 'https://requestb.in', // Optional – use webhooks to get transaction and error updates
    onLoad: function() {
      // Optional, called when Link loads
    },
    onSuccess: function(public_token, metadata) {
      // Send the public_token to your app server.
      // The metadata object contains info about the institution the
      // user selected and the account ID, if the Account Select view
      // is enabled.
      $.post('/get_access_token', {
        public_token: public_token,
      });
    },
    onExit: function(err, metadata) {
      // The user exited the Link flow.
      if (err != null) {
        // The user encountered a Plaid API error prior to exiting.
      }
      // metadata contains information about the institution
      // that the user selected and the most recent API request IDs.
      // Storing this information can be helpful for support.
    },
    onEvent: function(eventName, metadata) {
      // Optionally capture Link flow events, streamed through
      // this callback as your users connect an Item to Plaid.
      // For example:
      // eventName = "TRANSITION_VIEW"
      // metadata  = {
      //   link_session_id: "123-abc",
      //   mfa_type:        "questions",
      //   timestamp:       "2017-09-14T14:42:19.350Z",
      //   view_name:       "MFA",
      // }
    }
  });

  $('#link-button').on('click', function(e) {
    handler.open();
  });
})
