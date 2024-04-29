def uuid
  require 'securerandom'
  num = SecureRandom
  "#{num.hex(4)}-#{num.hex(2)}-#{num.hex(2)}-#{num.hex(2)}-#{num.hex(6)}" 
end

p uuid


