# typed: true


puts 0x1d434.to_s
# 

# puts ' * 𝐇𝐄𝐋𝐋𝐎 𝐖𝐎𝐑𝐋𝐃, 𝟎𝟏𝟐𝟑𝟒𝟓𝟔𝟕𝟔𝟖𝟗 : bold'

# String.

puts "\u2713".encode('utf-8')
puts "\u1d434".encode('utf-8')
puts "\u1d435".encode('utf-8')
puts "\u1d436".encode('utf-8')
puts "\u1d437".encode('utf-8')





require 'ansi/code'

puts ANSI.red + "Hello" + ANSI.blue + "World"

# x=119860
# puts x.chr
# puts '\u0x1d434'


# ss = "α"
# p ss # "α"

# ss.force_encoding("GB18030")
# p ss # "\x{CEB1}"

# require 'net/smtp'

# message = <<MESSAGE_END
# From: Private Person <me@fromdomain.com>
# To: A Test User <sebastian.gurin@gmail.com>
# Subject: SMTP e-mail test

# This is a test e-mail message.
# MESSAGE_END
# Net::SMTP.start('localhost') do |smtp|
#   smtp.send_message message, 'me@fromdomain.com', 
#                              'sebastian.gurin@gmail.com'
# end