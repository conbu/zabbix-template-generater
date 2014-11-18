#!/usr/bin/env ruby


def parse_string(data)
  result = []
  data.each_line do |line|
    str = (line.split /\s+=\s+/).last
    str =~ /STRING: "([^"]+)"/
    result << $1 if $1
  end
  result
end

def parse_mac_address(data)
  result = []
  data.each_line do |line|
    address = (line.split /\s+=\s+/).first
    address = (address.split '.')[-7..-1]
    address =  address.map do |digit|
      sprintf '%02X', digit
    end.join(':')
    result << address
  end
  result
end

