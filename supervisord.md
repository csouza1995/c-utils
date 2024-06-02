Supervisord for Linux CentOS
===


### This case are made to run Laravel queues and their jobs, but can be used for other reasons that require supervisord

___

Before starting, pay attention in your user role and, if necessary, use ``sudo`` as prefix of each command


First run installation commands
> yum install supervisor  
easy_install supervisor


Open the settings file of it
> nano /etc/supervisord.conf


And replace lasts rows of the file in the "include" section
> [include]  
files = /etc/supervisor/conf.d/*.conf


Now you can put your jobs settings in any file with ``.conf`` extension that are in following directory ``/etc/supervisor/conf.d``.  
Follow the example:
> [program:laravel-worker-emails]  
process_name=%(program_name)s_%(process_num)02d  
command=php artisan queue:work --queue=emails  
autostart=true  
autorestart=true  
stopasgroup=true  
killasgroup=true  
user=nginx  
numprocs=2  
redirect_stderr=true  
stdout_logfile=/logs/supervisord/laravel-worker-email.log
stopwaitsecs=3600  


Then configure the service to run automatically at system boot
> systemctl enable supervisord


And finally, restart the service
> systemctl restart supervisord


Reference and thanks
---
https://stackoverflow.com/questions/45224707/install-and-configure-supervisord-on-centos-7-to-run-laravel-queues-permanently


Tags
---
#supervisor #supervisord #linux #centos #laravel #jobs #queues #job #queue #doyourself
