import { combineReducers } from 'redux';

import citiesReducer from './cities';

const rootReducer = combineReducers({
  cities: citiesReducer
});

export default rootReducer;
