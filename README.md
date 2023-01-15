# Cover Lover = Phase 3 Sinatra React Project Front End

This is the backend for my Phase 3 Project, Cover Lover! The project is a single page application centered on musical artists, their songs, and the covers they've done of other artist's songs.

## Installation

Fork and clone, then run: 
```
bundle install
```
in the project's directory to install the necessary gems. Next, run:
```
bundle exec rake db:migrate
bundle exec rake db:seed
```
to run all the migrations that are going to build out the database tables and then fill those table with some seed data from the seeds.rb file. next, run:
```
bundle exec rake server
``` 
to start a rake server to host the app's backend on a local port. Once the server is up and running you should be ready to go! the [frontend](https://github.com/danielpdaniel/phase-3-sinatra-react-project-frontend) should be all set to make requests to the database and display the data in the browser once you've set that up as well, or you could make fetch requests using something like [postman](https://www.postman.com/)

## Usage

Feel free to play around with it! You can also fork and clone the [frontend](https://github.com/danielpdaniel/phase-3-sinatra-react-project-frontend) and run that in development mode using an npm server to make changes through the web app. The app includes full CRUD capabilities for the data related to each artist, their songs and their covers of songs through the various routes within the app. Or feel free to use [Postman](https://www.postman.com/) to try out the different routes defined in the application_controller file.

## Credits
This app uses [React](https://reactjs.org/) for its frontend,specifically [create-react-app](https://github.com/facebook/create-react-app) to set up the initial starter code for the React program.

It also uses [the phase 3 project code by lizbur10 on github](https://github.com/learn-co-curriculum/phase-3-sinatra-react-project) to set up the initial backend directory, which uses both [Sinatra](https://sinatrarb.com/) and [Active Record](https://guides.rubyonrails.org/active_record_basics.html) to build out the database functionality.

All song performances in the seed data have been sourced from YouTube and can be found at the following locations:

[New York, New York by Frank Sinatra](https://www.youtube.com/watch?v=Y2rDb4Ur2dw)

[Born This Way by Lady Gaga](https://www.youtube.com/watch?v=xl0N7JM3wZk)

[New York, New York covered by Lady Gaga](https://www.youtube.com/watch?v=hpiw3cDWmvc)

[New York, New York covered by Beyoncé](https://www.youtube.com/watch?v=hovCS_wk3Hc)

[Born This Way covered by Orville Peck](https://www.youtube.com/watch?v=2EOupP5bLnI)

This project was done for Phase 3 of the Flatiron School's Software Engineering Flex Program. Special thanks to everyone at Flatiron who helped me through this phase!