module Lita
  module Handlers
    class InMiddle < Handler
      @regex = /b\((.*)\)/
      route(@regex) do |response|
        @regex2 = /b\((.+)\)/
        msg_body = "#{robot.name}: #{response.message.body.match(@regex2)[1]}"
        puts msg_body
        robot.receive(Message.new(robot, msg_body, response.message.source))
      end
      Lita.register_handler(self)
    end
  end
end
