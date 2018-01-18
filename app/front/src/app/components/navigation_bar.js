import React, { Component } from 'react';
import { Navbar } from 'react-bootstrap';

export default class NavigationBar extends Component {
  render() {
    return (
      <Navbar>
        <Navbar.Header>
          <Navbar.Brand>
            <a href="/">{this.props.title}</a>
          </Navbar.Brand>

          <Navbar.Toggle />
        </Navbar.Header>

        <Navbar.Collapse>
          {this.props.children}
        </Navbar.Collapse>
      </Navbar>
    );
  }
}


