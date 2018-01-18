import axios from 'axios';

axios.defaults.baseURL = 'http://localhost:3000/api';
axios.defaults.headers.common['Content-Type'] = 'application/json';
axios.defaults.headers.common['Accept'] = 'application/vnd.rweather.com; version=1';

export default class APIClient {
  constructor(httpClient = axios) {
    this.httpClient = httpClient;
  }

  get(resource) {
    return this.httpClient.get(resource);
  }
}
