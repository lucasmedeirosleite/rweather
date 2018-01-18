import React from 'react';
import { Row, Col } from 'react-bootstrap';
import NavigationBar from './components/navigation_bar';
import SearchBar from './components/search_bar';
import Container from './components/container';
import Forecasts from './components/forecasts';

const App = () => {
  return (
    <div>
      <NavigationBar title="Open Weather">
        <SearchBar />
      </NavigationBar>

      <Container>
        <Row>
          <Col md={12}>
            <Forecasts />
          </Col>
        </Row>
      </Container>
    </div>
  );
};

export default App;
