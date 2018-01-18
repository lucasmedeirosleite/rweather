import { RANDOM_CITIES } from '../constants';
import APIClient from '../../../lib/api_client';

const api = new APIClient();

export function listRandomCities() {
  return {
    type: RANDOM_CITIES,
    payload: api.get('cities/random')
  };
}
