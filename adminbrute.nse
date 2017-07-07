local nmap = require "nmap"
local http = require "http"
local stdnse = require "stdnse"
local shortport = require "shortport"

description = [[
       admin dir find
]]


local admindir = {
"/dede",
"/admin",
"/e/admin/",
"/app/login.asp",
"/admin_login.asp",
"/admin_index.asp",
"/bin/login.asp",
"/asp/login.asp",
"/bdrtool/login.asp"
}


---
-- @usage
-- nmap --script admin-brute [--script-args admin-brute.path=mima.txt] <host>
---
-- @usage
-- nmap --script admin-brute [--script-args admin-brute.path=/login] <host>
-- | admin-brute:/admin/
-- @args admin-brute.path  dist file


author = "qingniao"
license = "git clone https://github.com/jingchagithub/nmap-script.git"
categories = {"brute"}

local PATH = stdnse.get_script_args(SCRIPT_NAME .. ".path" or nil)

if PATH~=nil then
        local y = 1  
        local file,error = io.open(PATH,"r")
        if file then
        for line in file:lines() do  
                admindir[y]=line
                y = y + 1   
        file:close()
                   end
        else
                         
        end 
end


portrule = shortport.port_or_service( {80, 443}, {"http", "https"}, "tcp", "open")

action = function(host, port)
                  local i=0
        local all=nil
        for  i=1,#admindir do
           all = http.pipeline_add(admindir[i],nil, all)
        end
         local results = http.pipeline_go(host, 80, all)
                  for i=1,#results do
                    if results[i].status ==200 then
                       return admindir[i]
                    end
                  end
                  return "admindir not find"
end
                                                               
      
        
