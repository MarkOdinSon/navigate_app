My study app to learn backend and frontend RoR.
-----
Run the following algorithm to deploy this project on your local machine.
Installation algorithm(steps):
1. git clone https://github.com/MarkOdinSon/navigate_app.git navigate_app
2. cd navigate_app
3. cp .env.example .env
4. cp docker-compose.override.yml.example docker-compose.override.yml
5. docker-compose up --build
6. ./run rails db:setup
7. go to http://localhost:8000/ and ./run test(this step may be skipped)
8. /run bundle:install

Enjoy!
