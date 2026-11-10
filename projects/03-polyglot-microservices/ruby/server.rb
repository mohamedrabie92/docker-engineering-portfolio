require 'socket'
require 'json'
server = TCPServer.new('0.0.0.0', 8080)
loop do
  socket = server.accept
  begin
    request = socket.gets.to_s
    path = request.split(' ')[1]
    if ['/', '/health'].include?(path)
      body = { service: 'ruby', status: 'ok' }.to_json
      status = '200 OK'
    else
      body = '{}'
      status = '404 Not Found'
    end
    socket.write("HTTP/1.1 #{status}\r\nContent-Type: application/json\r\nContent-Length: #{body.bytesize}\r\nConnection: close\r\n\r\n#{body}")
  ensure
    socket.close
  end
end
