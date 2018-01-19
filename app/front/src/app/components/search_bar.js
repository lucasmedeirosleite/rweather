import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Navbar, FormGroup, FormControl, Button } from 'react-bootstrap';
import { searchCity } from '../redux/actions/cities';

class SearchBar extends Component {
  constructor(props) {
    super(props);
    this.state = { term: '' };
  }

  onChange(event) {
    this.setState({ term: event.target.value });
  }

  onSubmit(event) {
    event.preventDefault();
    this.props.searchCity(this.state.term);
  }

  render() {
    return (
      <Navbar.Form pullLeft>
        <form onSubmit={this.onSubmit.bind(this)}>
          <FormGroup>
            <FormControl type="text"
                        placeholder="Type the city name..."
                        onChange={this.onChange.bind(this)} />
          </FormGroup>{' '}
          <Button type="submit">Search</Button>
        </form>
      </Navbar.Form>
    );
  }
}

export default connect(null, { searchCity })(SearchBar);
