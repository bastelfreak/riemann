require 'riemann/client'

c = Riemann::Client.new host: 'localhost', port: 5555, timeout: 5

val = Random.rand(100.0)
while true do
  event = {service: 'testing', metric: val, tags: ["app-random"]}
  puts event
  c << event
  diff = Math::log(Random.rand(100.0))
  if Random.rand(2) > 0 then
    val = val + diff
  else
    val = val - diff
  end
  sleep 0.5
end
