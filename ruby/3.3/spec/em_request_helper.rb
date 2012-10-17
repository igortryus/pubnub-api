require 'em-http'
require 'yajl'

def create_here_now_request options, subscribe_key, ssl = false
  here_now_request = PubnubRequest.new(:operation => :here_now)
  here_now_request.ssl = ssl
  here_now_request.set_channel(options)
  here_now_request.set_callback(options)
  here_now_request.set_cipher_key(options, nil)
  here_now_request.set_subscribe_key(options, subscribe_key)
  here_now_request.format_url!
  here_now_request
end

def create_detailed_history_request options, subscribe_key, ssl = false
  detailed_history_request = PubnubRequest.new(:operation => :detailed_history)
  detailed_history_request.ssl = ssl
  detailed_history_request.set_channel(options)
  detailed_history_request.set_callback(options)
  detailed_history_request.set_cipher_key(options, nil)
  detailed_history_request.set_subscribe_key(options, subscribe_key)
  detailed_history_request.history_count = options[:count]
  detailed_history_request.format_url!
  detailed_history_request
end