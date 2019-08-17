import React from 'react';
import ReactDOM from 'react-dom'
import Plot from 'react-plotly.js';
import CircularProgress from '@material-ui/core/CircularProgress';
import { Container, Col, Row } from 'react-bootstrap';
import DiscreteSlider from './floats_settings/3d_float_settings.js';



const newPlotElement = (width, height, title) =>
  <Plot
    config = { {displayModeBar : false} }
    style = {{marginBottom: -10}}
    key = '2'
    data={[
      {
        x: window.yN,
        y: window.xN,
        z: window.zN,
        type: 'surface',
        showscale: false,
        lighting: {specular: 0.1},
        lighting: {roughness: 0.9},
        colorscale: [
          ['0.0', 'rgb(165,0,38)'],
          ['0.111111111111', 'rgb(215,48,39)'],
          ['0.222222222222', 'rgb(244,109,67)'],
          ['0.333333333333', 'rgb(253,174,97)'],
          ['0.444444444444', 'rgb(254,224,144)'],
          ['0.555555555556', 'rgb(224,243,248)'],
          ['0.666666666667', 'rgb(171,217,233)'],
          ['0.777777777778', 'rgb(116,173,209)'],
          ['0.888888888889', 'rgb(69,117,180)'],
          ['1.0', 'rgb(49,54,149)']
        ],
      }
    ]}
    layout=
    {
      {
        scene: {
          xaxis:{
            showgrid: true,
            zeroline: true,
            showline: false,
            title: 'Date',
            autotick: true,
            ticks: 'outside',
            ticklen: 8,
            tickwidth: 4,
            gridcolor: '#F1EBFD',
            tickcolor: '#DEDBFC'
          },
          yaxis:{
            showgrid: true,
            zeroline: true,
            showline: false,
            title: 'Market place',
            autotick: true,
            ticks: 'outside',
            ticklen: 8,
            tickwidth: 4,
            gridcolor: '#F1EBFD',
            tickcolor: '#DEDBFC'
          },
          zaxis:{
            showgrid: true,
            zeroline: true,
            showline: false,
            title: 'Total stars',
            autotick: true,
            ticks: 'outside',
            ticklen: 8,
            tickwidth: 4,
            gridcolor: '#F1EBFD',
            tickcolor: '#DEDBFC'
          },
        },
        width: width,
        height: height,
        font: {
          family: 'Roboto, monospace',
          size: 13,
          color: '#7f7f7f'
        },
      }
    }
    
  />;

class Float3D1 extends React.Component
{
  constructor(props) {
    super(props);
    this.state = { data: [], layout: {}, frames: [], config: {} };
  }
  
  generateMap()
  {
    var xN = [];
    var yN = [];
    var zN = [];
    // window.mainAppFieldKey

    // Разделы
    xN.push('android');
    xN.push('apple');
    
    // Date
    for (var i = 0; i < window.globalAppData.ratings.length; i++)
    {
      if (window.globalAppData.ratings[i].shop_type == "android")
        yN.push(window.globalAppData.ratings[i].date);
    }
    
    // Rating для дат по андроиду
    // Rating для дат по apple
    var zYAndroid = [];
    for (var i = 0; i < window.globalAppData.ratings.length; i++)
    {
      if (window.globalAppData.ratings[i].shop_type == "android")
      zYAndroid.push(window.globalAppData.ratings[i].total_rating)
    }
    var zYApple = [];
    for (var i = 0; i < window.globalAppData.ratings.length; i++)
    {
      if (window.globalAppData.ratings[i].shop_type == "apple")
      zYApple.push(window.globalAppData.ratings[i].total_rating)
    }

    zN.push(zYAndroid);
    zN.push(zYApple)

    window.xN = xN;
    window.yN = yN;
    window.zN = zN;
  }

  add_component_with_latency()
  {
    setTimeout(()=>{
      var width = document.getElementById('mainFloat3D1').offsetWidth ;
      var height = document.getElementById('mainFloat3D1').offsetHeight ;
      var title = 'Kek lol';

      console.log(this.generateMap());

      // Рендерим основное
      var newEl = ReactDOM.render(
        newPlotElement(width,height,title),
        document.getElementById('mainFloat3D1')
      );
      // Рендерим настройки
      ReactDOM.render(
        DiscreteSlider(newEl),
        document.getElementById('float3Dsettings')
      );
    },1);
  }

  render()
  {
    return (
      <div id='mainFloat3D1' style = {{width: '100%', height: '100%'}}
        onLoad= {this.add_component_with_latency()}
        >
        <div className='d-flex justify-content-center align-items-center' style = {{width: '100%', height: '100%'}}>
          <CircularProgress  disableShrink/>
        </div>
      </div>
    );
  }
}
  
export default Float3D1;