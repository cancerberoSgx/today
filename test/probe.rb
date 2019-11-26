require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: A Test User <sebastian.gurin@gmail.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END
Net::SMTP.start('localhost') do |smtp|
  smtp.send_message message, 'me@fromdomain.com', 
                             'sebastian.gurin@gmail.com'
end