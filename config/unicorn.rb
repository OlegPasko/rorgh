root = "/home/deployer/apps/rorgh/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.rorgh.sock"
worker_processes 2
timeout 30
#add this for new relic or something else :)
#preload_app true