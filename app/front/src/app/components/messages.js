import React, { Component } from 'react';
import { Alert } from 'react-bootstrap';
import { connect } from 'react-redux';

class Messages extends Component {
  render() {
    if (this.props.message === '') {
      return <div></div>;
    }

    return (
      <Alert bsStyle="warning">
        <strong>Holy guacamole!</strong> {this.props.message}
      </Alert>
    );
  }
}

function mapStateToProps({ cities }) {
  if (cities instanceof Error) {
    return { message: 'Forecast for the city not found.' };
  }

  return { message: '' };
}

export default connect(mapStateToProps, null)(Messages);
