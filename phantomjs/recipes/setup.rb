#Installing phantomjs from source in bitbucket

Chef::Log.info("Downloading the phantomjs source from ::: https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2")
remote_file "/usr/local/share/phantomjs-1.9.8-linux-x86_64.tar.bz2" do
  source "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2"
end

Chef::Log.info("Extracting phantomjs source")
execute "sudo tar xjf /usr/local/share/phantomjs-1.9.8-linux-x86_64.tar.bz2" do
  cwd "/usr/local/share"
end

Chef::Log.info("Installing phantomjs dependencies")
execute "sudo yum -y install fontconfig freetype libfreetype.so.6 libfontconfig.so.1 libstdc++.so.6" do
  cwd "/usr/local/share/phantomjs-1.9.8-linux-x86_64.tar.bz2"
end
execute "sudo ln -s /usr/local/share/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs"
execute "sudo ln -s /usr/local/share/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs"
execute "sudo ln -s /usr/local/share/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/bin/phantomjs"
