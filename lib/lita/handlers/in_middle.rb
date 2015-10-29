module Lita
  module Handlers
    class InMiddle < Handler
      @regex = /b\((.*)\)/
      route(@regex) do |response|
        @regex2 = /b\((.*)\)/
        msg_body = "#{robot.name}: #{response.message.body.gsub(@regex2, "\\1")}"
        robot.receive(Message.new(robot, msg_body, response.message.source))
      end
      Lita.register_handler(self)
    end
  end
end
