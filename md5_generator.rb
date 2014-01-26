require 'digest/md5'

def encrypt(password) 
  return Digest::MD5.hexdigest(password)
end
