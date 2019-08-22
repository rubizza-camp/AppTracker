import React from 'react';
import ReactDOM from 'react-dom'
import Grid from '@material-ui/core/Grid';
import Plot from 'react-plotly.js';
import CircularProgress from '@material-ui/core/CircularProgress';
import Rating from '@material-ui/lab/Rating';
import Icon from '@material-ui/core/Icon';
import IconButton from '@material-ui/core/IconButton';

function loadBarChartDownloadsCountData(shop_type)
{
  var xN = [];
  var yN = [];

  // Date
  for (var i = 0; i < window.globalAppData.dynamic_infos.length; i++)
  {
    if (window.globalAppData.dynamic_infos[i].country == "ru")
    if (window.globalAppData.dynamic_infos[i].shop_type == shop_type)
    xN.push(window.globalAppData.dynamic_infos[i].date);
  }

  // Downloads
  // ru
  var index = 0;
  yN.push([]);
  for(var i = 0; i < window.globalAppData.dynamic_infos.length; i++)
  {
    if (window.globalAppData.dynamic_infos[i].country == "ru")
    if (window.globalAppData.dynamic_infos[i].shop_type == shop_type)
    yN[index].push(window.globalAppData.dynamic_infos[i].downloads)
  }
  index++

  // us
  yN.push([]);
  for(var i = 0; i < window.globalAppData.dynamic_infos.length; i++)
  {
    if (window.globalAppData.dynamic_infos[i].country == "us")
    if (window.globalAppData.dynamic_infos[i].shop_type == shop_type)
    yN[index].push(window.globalAppData.dynamic_infos[i].downloads)
  }
  index++

  return {
    x: xN,
    y: yN,
  }
}

const newDownloadBarChartElement = (width, height, data) =>
<>
  <Plot
    config = { {displayModeBar : false} }
    style = {{marginBottom: -10}}
    key = '2'
    data={[
      {
        x: data.x,
        y: data.y[0],
        name: 'Russian downloads',
        stackgroup: 'one',
        line: {
          shape: 'spline',
          width: 2,
          color: "#173F5F",
        },
      },
      {
        x: data.x,
        y: data.y[1],
        name: 'United States downloads',
        stackgroup: 'one',
        line: {
          shape: 'spline',
          width: 2,
          color: "#FFB40D",
        },
      },
    ]}
    layout=
    {
      {
        showlegend: false,
        margin: {
          l: 40,
          r: 35,
          b: 50,
          t: 0,
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
          showgrid: true,
          zeroline: false,
          showline: false,
          showticklabels: true
        },
      }
    }
  />
  <div className='plot-cove-downloads-countries-container'>
    <div className='plot-cove-downloads-countries-item'>
      <div className='circle' style={{backgroundColor : "#173F5F"}}></div>
      <div className='text'>United States</div>
    </div>
    <div className='plot-cove-downloads-countries-item'>
      <div className='circle' style={{backgroundColor : "#FFB40D"}}></div>
      <div className='text'>Russia</div>
    </div>
  </div>
</>;

function add_DownloadBarChart_with_latency(id,shop_type)
{
  setTimeout(()=>{
    var width = document.getElementById(id).offsetWidth ;
    var height = document.getElementById(id).offsetHeight ;

    // Рендерим основное
    ReactDOM.render(
      newDownloadBarChartElement(width,height,loadBarChartDownloadsCountData(shop_type)),
      document.getElementById(id)
    );
  },1);
}

export default function DownloadsPlotTab() {
  return (
    <>
      <Grid container>
        <Grid item xs={12} sm={12}>
          <div class="plot-cove-comments-title" >
            <div style={{fontSize:"0.9rem", fontWeight:400, alignSelf:"self-start"}}>
                Google Play
            </div>
            <div style={{display:"flex", alignItems:"center", justifyContent:"center"}}>
              <div style={
                {
                  width: 30,
                  height: 30,
                  borderRadius: 25,
                  backgroundImage:'url("'+window.globalAppData.icon_url+'") ',
                  backgroundSize: "cover",
                }} >
              </div>
              <div style={{fontSize:"1.5rem", fontWeight:300}}>
                  {window.globalAppData.title}
              </div>
            </div>
            
            <IconButton className="covei-badge-button" href={window.globalAppData.android_url}>
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
        <Grid item xs={12} sm={12} style={{margin: 10, textAlign: "center"}}>Downloads count per day by countries</Grid>
        <Grid item xs={12} sm={12} id="DownloadsAndroidBarChartId1" className="flext-center non-selectable"
          style={{minHeight:350}}
          onLoad= {add_DownloadBarChart_with_latency("DownloadsAndroidBarChartId1","android")}>
          <CircularProgress/>
        </Grid>
      </Grid>
      
      <Grid container>
        <Grid item xs={12} sm={12}>
          <div class="plot-cove-comments-title" >
            <div style={{fontSize:"0.9rem", fontWeight:400, alignSelf:"self-start"}}>
                App Store
            </div>
            
            <IconButton className="covei-badge-button" href={window.globalAppData.apple_url}>
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
        <Grid item xs={12} sm={12} style={{margin: 10, textAlign: "center"}}>Downloads count per day by countries</Grid>
        <Grid item xs={12} sm={12} id="DownloadsIosBarChartId1" className="flext-center non-selectable"
          style={{minHeight:350}}
          onLoad= {add_DownloadBarChart_with_latency("DownloadsIosBarChartId1","ios")}>
          <CircularProgress/>
        </Grid>
      </Grid>
    </>
  );
}