$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'helloworld_services_pb'

class GreeterServer < Helloworld::Greeter::Service
  def say_hello(req, call)
    Helloworld::HelloReply.new(message: "Hello #{req.name}")
  end
end

s = GRPC::RpcServer.new
s.add_http2_port('0.0.0.0:8000', :this_port_is_insecure)
s.handle(GreeterServer)
s.run_till_terminated
