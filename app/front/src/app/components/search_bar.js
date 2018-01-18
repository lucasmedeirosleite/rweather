import React, { Component } from 'react';
import { Navbar, FormGroup, FormControl, Button } from 'react-bootstrap';

class SearchBar extends Component {
  constructor(props) {
    super(props);
    this.state = { term: '' };
  }

  render() {
    return (
      <Navbar.Form pullLeft>
        <FormGroup>
          <FormControl type="text" placeholder="Type the city name..." />
        </FormGroup>{' '}
        <Button type="submit">Search</Button>
      </Navbar.Form>
    );
  }
}

export default SearchBar;
