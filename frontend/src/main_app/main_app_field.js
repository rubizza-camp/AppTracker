import React from 'react';
import ReactSVG from 'react-svg'
import { Container, Col, Row } from 'react-bootstrap';
import './main_app_field.css';
import MinSearchEl from './min_search_element/min_search_element.js';
import AppTitlerEl from './app_titler_element/app_titler_element.js';
import Float3D1 from './floats/3d_float.js';
import CircularProgress from '@material-ui/core/CircularProgress';

class MainAppField extends React.Component
{
  increment()
  {
    if (window.mainAppFieldKey == undefined)
    {
      window.mainAppFieldKey = 1;
    }
    else
    {
      window.mainAppFieldKey++;
    }
    return window.mainAppFieldKey
  }
  render()
  {
    return (
      <div key={this.increment()} id='MainAppField' className='d-flex justify-content-center align-items-center' style={{width: '100vw', maxWidth: '900px'}}>
        <Container className='m-0 p-0'>
          <Row className='m-0 pl-2 pr-2'>
            <Col sm={4} className='m-0 p-0 d-flex justify-content-center'>
              <ReactSVG style= {{minWidth: "250px", width:"50%", padding:"15px"}} src="Icons/AppTrackerTitleColored.svg" />
            </Col>
            <Col sm={8} className='m-0 p-0 d-flex align-items-center'>
                <MinSearchEl>
                </MinSearchEl>
            </Col>
          </Row>
          <Row className='m-0 p-0'>
            <Col sm={4} className='m-0 p-0'>
              <Row className='m-0 p-2'>
                <div className='card-covei' style = {{ height: 'auto'}}>
                  <AppTitlerEl>
                  </AppTitlerEl>
                </div>
              </Row>
              <Row className='m-0 p-2'>
                <div id='float3Dsettings' className='card-covei' style = {{ height: '60vh'}}>
                  <div className='d-flex justify-content-center align-items-center' style = {{width: '100%', height: '100%'}}>
                    <CircularProgress  disableShrink/>
                  </div>
                </div>
              </Row>
            </Col>
            <Col sm={8} className='m-0 p-2'>
              <div className='card-covei' style = {{ height: '100%', minHeight: 400}}>
                <Float3D1>
                </Float3D1>
              </div>
            </Col>
          </Row>
        </Container>
      </div>
    );
  }
}

export default MainAppField;
