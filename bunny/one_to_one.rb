require "bunny"

STDOUT.sync = true

# Connects to RabbitMQ running on localhost, with the default
# port (5672), username ("guest"), password ("guest") and virtual host ("/").
conn = Bunny.new
conn.start

# Opens a new channel. AMQP 0.9.1 is a multi-channeled protocol that uses
# channels to multiplex a TCP connection.
# Channels are opened on a connection. Bunny::Session#create_channel
# will return only when Bunny receives a confirmation.
ch = conn.create_channel

# Declares a queue on the channel that we have just opened.
q  = ch.queue("bunny.examples.hello_world", :auto_delete => true)
# The exchange that we use is known as the default exchange and it has implied
# bindings to all queues
x  = ch.default_exchange

q.subscribe do |delivery_info, metadata, payload|
  puts "Received #{payload}"
end

x.publish("Hello!", :routing_key => q.name)

sleep 1.0
conn.close