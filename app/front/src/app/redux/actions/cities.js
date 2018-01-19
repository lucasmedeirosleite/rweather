import { RANDOM_CITIES, SEARCH_CITY } from '../constants';
import APIClient from '../../../lib/api_client';

const api = new APIClient();

export function listRandomCities() {
  return {
    type: RANDOM_CITIES,
    payload: api.get('cities/random')
  };
}

export function searchCity(term) {
  return {
    type: SEARCH_CITY,
    payload: api.get(`cities/search?term=${term}`)
  }
}
