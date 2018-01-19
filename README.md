# RWEATHER APP

This application searches for forecasts using the [Open Weather API](http://openweathermap.org/api):

## Application stack:

The application is divided in two parts:

* Backend;
* Frontend;

### Backend

The backend stack is:

* Ruby (2.4.3) / Rails (5.1);
* PostgreSQL;

The Rails application was tested using `RSpec`;

### Frontend

The frontend stack is:

* ReactJS;
* ReactBootstrap;
* Redux;
* ReduxPromise;
* Axios (for http requests to the backend);

#### Running locally

First follow these steps:

* run `cp .env.sample .env`
* Update postgres conf with yours
* Update Open Weather API key with yours

##### Installing Dependencies

You will need to have installed:

* Ruby 2.4.2
* NodeJS 6+
* Yarn
* PostgreSQL

###### Running locally

Just run `bin/rails s` to start the server at `http://localhost:3000`

##### Running tests

To run the specs just use `bundle exec rspec spec`

#### Open API

##### Structures

```javascript
const date_s = string('UTC date on format YYYY-MM-DD HH:mm:ss')

const Country = {
  name: string,
}

Coordinate = {
  latitude: number,
  longitude: number
}

Wind = {
  speed: number,
  direction: number
}

Temperature = {
  value: number,
  min: number,
  max: number,
  pressure: number,
  humidity: number
}

Weather = {
  main: string,
  description: string,
  visibility: number,
  clouds: number
}

Forecast = {
  date: date_s,
  weather: Weather,
  temperature: Temperature,
  wind: Wind
}

const City = {
  name: string,
  country: Country,
  coordinate: Coordinate,
  forecast: Forecast
}
```

##### ENDPOINTS

HTTP METHOD| Path | Returns | Status | Description
--- | --- | --- | --- | ---
GET | /api/cities/random | [City] | 200, 500 | List random forecasts of cities
GET | /api/cities/search?term={term} | [City] | 200, 404, 500 | Searches for a city by its name
