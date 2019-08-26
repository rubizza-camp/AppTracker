// jshint esversion:9
import React from 'react';
import ReactDOM from 'react-dom'
import Grid from '@material-ui/core/Grid';
import Plot from 'react-plotly.js';
import CircularProgress from '@material-ui/core/CircularProgress';
import Rating from '@material-ui/lab/Rating';
import Icon from '@material-ui/core/Icon';
import IconButton from '@material-ui/core/IconButton';

// window.applicationData = response.data.data.attributes;
// window.dynamicInfos = dynamicInfos;
// window.ratings = ratings;

function loadBarChartCountData(shop_type, line_type)
{
  var xN = [];
  var yN = [];

  // Date
  for (var i = 0; i < window.dynamicInfos.length; i++)
  {
    if (window.dynamicInfos[i].Country == "ru")
    if (window.dynamicInfos[i].ShopType == shop_type)
    xN.push(window.dynamicInfos[i].Date);
  }

  // Downloads
  // ru
  var index = 0;
  yN.push([]);
  for(var i = 0; i < window.dynamicInfos.length; i++)
  {
    if (window.dynamicInfos[i].Country == "ru")
    if (window.dynamicInfos[i].ShopType == shop_type)
    yN[index].push(window.dynamicInfos[i][line_type])
  }
  index++

  // us
  yN.push([]);
  for(var i = 0; i < window.dynamicInfos.length; i++)
  {
    if (window.dynamicInfos[i].Country == "us")
    if (window.dynamicInfos[i].ShopType == shop_type)
    yN[index].push(window.dynamicInfos[i][line_type])
  }
  index++

  return {
    x: xN,
    y: yN,
  }
}

const newBarChartElement = (width, height, data, autorange_type, title_text
) =>
<>
  
  <Plot
    config = { {displayModeBar : false} }
    style = {{marginBottom: -10}}
    key = '2'
    data={[
      {
        x: data.x,
        y: data.y[0],
        name: 'Russian',
        mode: 'lines',
        line: {
          shape: 'spline',
          width: 2,
          color: "#eb7659",
        },
      },
      {
        x: data.x,
        y: data.y[1],
        name: 'United States',
        mode: 'lines',
        line: {
          shape: 'spline',
          width: 2,
          color: "#9318ff",
        },
      },
    ]}
    layout=
    {
      {
        legend: {
          x: 0,
          y: -0.75,
          traceorder: 'normal',
          font: {
            family: 'sans-serif',
            size: 12,
            color: '#000'
          },
          bgcolor: '#FFFFFF',
          bordercolor: '#FFFFFF',
          borderwidth: 2
        },
        margin: {
          l: 40,
          r: 35,
          b: 20,
          t: 10,
          pad: 0
        },
        width: width,
        height: height,
        font: {
          family: 'Roboto, monospace',
          size: 13,
          color: '#7f7f7f'
        },
        xaxis: {
          showline: true,
          showgrid: true,
          showticklabels: true,
          linecolor: 'rgb(255,255,255)',
          linewidth: 3,
          autotick: true,
          ticks: 'inside',
          tickcolor: 'rgb(55,55,55)',
          tickwidth: 1,
          ticklen: 3,
          tickfont: {
            family: 'Roboto',
            size: 14,
            color: 'rgb(82, 82, 82)'
          }
        },
        yaxis: {
          rangemode: 'nonnegative',
          showgrid: true,
          zeroline: false,
          showline: false,
          showticklabels: true,
          autorange: autorange_type,
        },
      }
    }
  />
</>;

function add_BarChart_with_latency(id,shop_type,line_type,autorange_type)
{
  setTimeout(()=>{
    var width = document.getElementById(id).offsetWidth ;
    var height = document.getElementById(id).offsetHeight ;

    // Рендерим основное
    ReactDOM.render(
      newBarChartElement(width,height,loadBarChartCountData(shop_type,line_type),autorange_type),
      document.getElementById(id)
    );
  },1);
}

export default function RankPositionsPlotTab() {
  return (
    <>
      <Grid container>
        <Grid item xs={12} sm={12}>
          <div className="plot-cove-comments-title" >
            <div style={{fontSize:"0.9rem", fontWeight:400, alignSelf:"self-start"}}>
                Google Play
            </div>
            <div style={{display:"flex", alignItems:"center", justifyContent:"center"}}>
              <div style={
                {
                  width: 30,
                  height: 30,
                  borderRadius: 25,
                  backgroundImage:'url("'+window.applicationData.IconUrl+'") ',
                  backgroundSize: "cover",
                }} >
              </div>
              <div style={{fontSize:"1.5rem", fontWeight:300}}>
                  {window.applicationData.Title}
              </div>
            </div>
            
            <IconButton className="covei-badge-button" href={window.applicationData.AndroidUrl}>
              <Icon style={
              {
                width: "100px",
                height: "40px",
                borderRadius: 13,
                backgroundImage:'url("https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png") ',
                backgroundSize: "cover",
              }}></Icon>
            </IconButton>
          </div>
        </Grid>
        <Grid item xs={12} sm={6}>
          <Grid item xs={12} sm={12} style={{padding: 10, textAlign: "center"}}>Power</Grid>
          <Grid item xs={12} sm={12} id="RankAndroidBarChartId1" className="flext-center non-selectable"
            style={{minHeight:200, maxHeight:255}}
            onLoad= {add_BarChart_with_latency("RankAndroidBarChartId1","android","Power",true)}>
            <CircularProgress/>
          </Grid>
        </Grid>
        
        
        <Grid item xs={12} sm={6}>
          <Grid item xs={12} sm={12} style={{padding: 10, textAlign: "center"}}>Rank</Grid>
          <Grid item xs={12} sm={12} id="PowerAndroidBarChartId1" className="flext-center non-selectable"
            style={{minHeight:200, maxHeight:255}}
            onLoad= {add_BarChart_with_latency("PowerAndroidBarChartId1","android","Rank","reversed")}>
            <CircularProgress/>
          </Grid>
        </Grid>
        
      </Grid>

      <Grid container>
        <Grid item xs={12} sm={12}>
          <div className="plot-cove-comments-title" >
            <div style={{fontSize:"0.9rem", fontWeight:400, alignSelf:"self-start"}}>
                App Store
            </div>
            
            <IconButton className="covei-badge-button" href={window.applicationData.AppleUrl}>
              <Icon style={
              {
                width: "97px",
                height: "32px",
                borderRadius: 5,
                backgroundImage:'url("https://developer.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store.svg") ',
                backgroundSize: "cover",
              }}></Icon>
            </IconButton>
          </div>
        </Grid>
        <Grid item xs={12} sm={6}>
          <Grid item xs={12} sm={12} style={{padding: 10, textAlign: "center"}}>Power</Grid>
          <Grid item xs={12} sm={12} id="RankIosBarChartId1" className="flext-center non-selectable"
            style={{minHeight:200, maxHeight:255}}
            onLoad= {add_BarChart_with_latency("RankIosBarChartId1","ios","Power",true)}>
            <CircularProgress/>
          </Grid>
        </Grid>
        <Grid item xs={12} sm={6}>
          <Grid item xs={12} sm={12} style={{padding: 10, textAlign: "center"}}>Rank</Grid>
          <Grid item xs={12} sm={12} id="PowerIosBarChartId1" className="flext-center non-selectable"
            style={{minHeight:200, maxHeight:255}}
            onLoad= {add_BarChart_with_latency("PowerIosBarChartId1","ios","Rank","reversed")}>
            <CircularProgress/>
          </Grid>
        </Grid>
      </Grid>
    </>
  );
}