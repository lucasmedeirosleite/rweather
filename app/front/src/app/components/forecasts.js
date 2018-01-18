import React, { Component } from 'react';
import { connect } from 'react-redux';
import { PageHeader, Row, Col, Table } from 'react-bootstrap';

import { listRandomCities } from '../redux/actions/cities';

class Forecasts extends Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    this.props.listRandomCities();
  }

  renderCities() {
    if (!this.props.cities) {
      return;
    }

    return this.props.cities.map((city, index) => {
      const { name, forecast } = city;

      return (
        <tr key={index + 1}>
          <td>
            {name}
          </td>
          <td>
            {forecast.temperature.value}
          </td>
          <td>
            {forecast.weather.main}
          </td>
          <td>
            {`${forecast.weather.clouds}%`}
          </td>
          <td>
            {forecast.wind.speed}
          </td>
        </tr>
      );
    });
  }

  render() {
    return(
      <div>
        <PageHeader>
          Forecasts <small>here you can see forecasts of one or more cities</small>
        </PageHeader>

        <Row>
          <Col md={12}>
            <Table striped bordered condensed hover responsive>
              <thead>
                <tr>
                  <th>City</th>
                  <th>Temperature (Celsius)</th>
                  <th>Condition</th>
                  <th>Clouds (%)</th>
                  <th>Wind (mps)</th>
                </tr>
              </thead>
              <tbody>
                {this.renderCities()}
              </tbody>
            </Table>
          </Col>
        </Row>
      </div>
    );
  }
}

function mapStateToProps({ cities }) {
  return { cities: cities.data };
}

export default connect(mapStateToProps, { listRandomCities })(Forecasts);
