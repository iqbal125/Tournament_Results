# Tournament_Results

This project uses Python and PSQL to simulate a sports ranking system.<br>
Wins and Loses are recorded and players with similar number of wins are matched together.<br>

Prerequisites:
Running this project requires basic knowledge of Vagrant, Python and PSQL<br>
You must have Python and PSQL installed
You must also have Vagrant installed and ready for use with VM box<br>
If you are not fimiliar with Vagrant visit https://www.vagrantup.com/docs/getting-started/ for more details<br>
For more details on VM box visit https://www.virtualbox.org/

Running the App:
1. Open up your terminal
2. cd into your Vagrant directory 
3. Run the vagrant up command
4. Run the vagrant ssh command
5. cd into your project directory
6. Open up a new terminal
7. Run vagrant ssh 
8. Type PSQL and hit enter
9. To set up the database, simply copy and paste the indivdual commands from the SQL file
10. To see the database you can run \dt, which will print a basic outline of the database. 
11. Go back to your original terminal 
12. Run the tournament_test.py file
13. If done correctly, there should be a print statement saying "Success!  All tests pass!"
14. Feel free to modify the tournament.sql and tournament_test.py file for different outputs and configurations.












