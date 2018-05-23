# README

1. Ruby version - 2.4.1

2. Rails version - 5.2.0

3. Datebase - Mysql

4. Download project from github or clone 

git clone https://github.com/ashishsingh1990/test_bac.git
after that run command on console bundle install.

5. Download ruby-sidekiq if sidekiq is not install on your local machine. which is given below.

sudo apt install ruby-sidekiq

6. Goto database.yml and set database credentials.

eg. username: root, 
    password: root

I have given example username and password need to set according to your database.

7. Open terminal and run command on console. 

  rake db:create && rake db:migrate

8. Start sidekiq for background jobs, Open another terminal run command on console.

   sidekiq 

9. start rails server

10. Make excelsheet

- sheet-1 with header which is given below 
---------------------
name,  description

You can create record eg.  Ashish,  He is good developer

- sheet-2 with header which is given below  
-----------------------
name,  description

You can create record eg. Naveen,  He is good manager

-------------------------------------------------------
After that you can upload execelsheet and click save button. It will upload from backgroud or file size should be less than 10 MB if file size more than 10MB you will get error message on the screen with red color. 