local comm = require "comm"
local nmap = require "nmap"
local stdnse = require "stdnse"
description = [[
      nmap  hello world
]]

---
-- @output
-- 21/tcp open  ftp
-- |_ hello_world: hello world

author = "qingniao"
license = "git clone https://github.com/jingchagithub/nmap-script.git"
categories = {"safe"}

---
-- Script is executed for any TCP port.
portrule = function( host, port )
    return true
end


---
-- outputs "hello world"
action = function( host, port)
      return "hello world"
end
