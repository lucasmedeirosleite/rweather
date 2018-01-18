import { SEARCH_CITY, RANDOM_CITIES } from '../constants';

const citiesReducer = (state = [], action) => {
  switch(action.type) {
    case SEARCH_CITY:
      return action.payload;
    case RANDOM_CITIES:
      return action.payload;
    default:
      return state;
  }
}

export default citiesReducer;
