// jshint esversion:9
import React from 'react';
import ReactDOM from 'react-dom'
import Grid from '@material-ui/core/Grid';
import Plot from 'react-plotly.js';
import CircularProgress from '@material-ui/core/CircularProgress';
import Rating from '@material-ui/lab/Rating';
import Icon from '@material-ui/core/Icon';
import IconButton from '@material-ui/core/IconButton';

function loadPlotStarsCountData(shop_type,data_type)
{
  var xN = [];
  var yN = [];

  // Date
  for (var i = 0; i < window.ratings.length; i++)
  {
    if (window.ratings[i].ShopType == shop_type)
    xN.push(window.ratings[i].Date);
  }

  // Stars
  for(var i = 0; i < window.ratings.length; i++)
  {
    if (window.ratings[i].ShopType == shop_type)
    yN.push(window.ratings[i][data_type])
  }

  return {
    x: xN,
    y: yN,
  }
}

function loadBarChartStarsCountData(shop_type)
{
  var xN = [];
  var yN = [];

  // Date
  for (var i = 0; i < window.ratings.length; i++)
  {
    if (window.ratings[i].ShopType == shop_type)
    xN.push(window.ratings[i].Date);
  }

  // Stars
  var index = 0;
  yN.push([]);
  for(var i = 0; i < window.ratings.length; i++)
  {
    if (window.ratings[i].ShopType == shop_type)
    yN[index].push(window.ratings[i].Rating1)
  }
  index++

  yN.push([]);
  for(var i = 0; i < window.ratings.length; i++)
  {
    if (window.ratings[i].ShopType == shop_type)
    yN[index].push(window.ratings[i].Rating2)
  }
  index++

  yN.push([]);
  for(var i = 0; i < window.ratings.length; i++)
  {
    if (window.ratings[i].ShopType == shop_type)
    yN[index].push(window.ratings[i].Rating3)
  }
  index++

  yN.push([]);
  for(var i = 0; i < window.ratings.length; i++)
  {
    if (window.ratings[i].ShopType == shop_type)
    yN[index].push(window.ratings[i].Rating4)
  }
  index++

  yN.push([]);
  for(var i = 0; i < window.ratings.length; i++)
  {
    if (window.ratings[i].ShopType == shop_type)
    yN[index].push(window.ratings[i].Rating5)
  }
  index++

  // Average rating

  yN.push([]);
  for(var i = 0; i < window.ratings.length; i++)
  {
    if (window.ratings[i].ShopType == shop_type)
    yN[index].push(window.ratings[i].AverageRating)
  }
  index++

  return {
    x: xN,
    y: yN,
  }
}

const newPlotElementWithBotAxis = (width, height, data, color, rating_stars_count) =>
<>
  <Plot
    config = { {displayModeBar : false} }
    style = {{marginBottom: -10}}
    key = '2'
    data={[
      {
        x: data.x,
        y: data.y,
        mode: 'lines',
        line: {
          shape: 'spline',
          width: 2,
          color: color,
        },
        type: 'scatter'
      },
    ]}
    layout=
    {
      {
        showlegend: false,
        margin: {
          l: 20,
          r: 20,
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
          showgrid: false,
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
          showgrid: false,
          zeroline: false,
          showline: false,
          showticklabels: false
        },
      }
    }
  />
  <div className='plot-cove-comments-rating-title'>
    <Rating style={{color: color}} value={rating_stars_count} readOnly />
  </div>
</>;

const newBarChartElementWithBotAxis = (width, height, data) =>
<>
  <Plot
    config = { {displayModeBar : false} }
    style = {{marginBottom: -10}}
    key = '2'
    data={[
      {
        x: data.x,
        y: data.y[0],
        name: '1 star',
        stackgroup: 'one',
        line: {
          shape: 'spline',
          width: 2,
          color: "#FF0034",
        },
      },
      {
        x: data.x,
        y: data.y[1],
        name: '2 star',
        stackgroup: 'one',
        line: {
          shape: 'spline',
          width: 2,
          color: "#EB0098",
        },
      },
      {
        x: data.x,
        y: data.y[2],
        name: '3 star',
        stackgroup: 'one',
        line: {
          shape: 'spline',
          width: 2,
          color: "#F200FF",
        },
      },
      {
        x: data.x,
        y: data.y[3],
        name: '4 star',
        stackgroup: 'one',
        line: {
          shape: 'spline',
          width: 2,
          color: "#A600EB",
        },
      },
      {
        x: data.x,
        y: data.y[4],
        name: '5 star',
        stackgroup: 'one',
        line: {
          shape: 'spline',
          width: 2,
          color: "#7E0DFF",
        },
      },
      {
        x: data.x,
        y: data.y[5],
        name: 'Average rating',
        yaxis: 'y2',
        mode: 'lines',
        line: {
          shape: 'spline',
          width: 3,
          color: "#B83C2F",
        },
        type: 'scatter'
      },
    ]}
    layout=
    {
      {
        showlegend: false,
        margin: {
          l: 50,
          r: 0,
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
        yaxis2: {
          showline: false,
          showgrid: false,
          showticklabels: true,
          overlaying: 'y',
          side: 'right',
        }
      }
    }
  />
</>;

function add_plot_with_latency_botAxis(id,shop_type,data_type,color,rating_stars_count)
{
  setTimeout(()=>{
    var width = document.getElementById(id).offsetWidth ;
    var height = document.getElementById(id).offsetHeight ;

    // Рендерим основное
    ReactDOM.render(
      newPlotElementWithBotAxis(width,height,loadPlotStarsCountData(shop_type,data_type),color,rating_stars_count),
      document.getElementById(id)
    );
  },1);
}

function add_BarChart_with_latency(id,shop_type)
{
  setTimeout(()=>{
    var width = document.getElementById(id).offsetWidth ;
    var height = document.getElementById(id).offsetHeight ;

    // Рендерим основное
    ReactDOM.render(
      newBarChartElementWithBotAxis(width,height,loadBarChartStarsCountData(shop_type)),
      document.getElementById(id)
    );
  },1);
}



export default function CommentsPlotTab() {
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
        <Grid item xs={12} sm={12} style={{margin: 10, textAlign: "center"}}>Total number of star-ratings per day</Grid>
        <Grid item xs={12} sm={6} id="CommentsAndroidBarChartId1" className="flext-center non-selectable"
          style={{minHeight:350}}
          onLoad= {add_BarChart_with_latency("CommentsAndroidBarChartId1","android")}>
          <CircularProgress/>
        </Grid>
        <Grid item xs={12} sm={6}>
          {/* <Grid item xs={12} sm={12} style={{margin: 10, textAlign: "center"}}>Total number of star-ratings per day</Grid> */}
          <Grid item xs={12} sm={12} id="CommentsAndroidPlotTabId1" className="flext-center non-selectable"
            style={{minHeight:120}}
            onLoad= {add_plot_with_latency_botAxis("CommentsAndroidPlotTabId1","android","Rating5","#7E0DFF",5)}>
            <CircularProgress/>
          </Grid>
          <Grid item xs={12} sm={12} id="CommentsAndroidPlotTabId2" className="flext-center non-selectable"
            style={{minHeight:120}}
            onLoad= {add_plot_with_latency_botAxis("CommentsAndroidPlotTabId2","android","Rating4","#A600EB",4)}>
            <CircularProgress/>
          </Grid>
          <Grid item xs={12} sm={12} id="CommentsAndroidPlotTabId3" className="flext-center non-selectable"
            style={{minHeight:120}}
            onLoad= {add_plot_with_latency_botAxis("CommentsAndroidPlotTabId3","android","Rating3","#F200FF",3)}>
            <CircularProgress/>
          </Grid>
          <Grid item xs={12} sm={12} id="CommentsAndroidPlotTabId4" className="flext-center non-selectable"
            style={{minHeight:120}}
            onLoad= {add_plot_with_latency_botAxis("CommentsAndroidPlotTabId4","android","Rating2","#EB0098",2)}>
            <CircularProgress/>
          </Grid>
          <Grid item xs={12} sm={12} id="CommentsAndroidPlotTabId5" className="flext-center non-selectable"
            style={{minHeight:120}}
            onLoad= {add_plot_with_latency_botAxis("CommentsAndroidPlotTabId5","android","Rating1","#FF0034",1)}>
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
        <Grid item xs={12} sm={12} style={{margin: 10, textAlign: "center"}}>Total number of star-ratings per day</Grid>
        <Grid item xs={12} sm={6} id="CommentsIosBarChartId1" className="flext-center non-selectable"
          style={{minHeight:350}}
          onLoad= {add_BarChart_with_latency("CommentsIosBarChartId1","ios")}>
          <CircularProgress/>
        </Grid>
        <Grid item xs={12} sm={6}>
          <Grid item xs={12} sm={12} id="CommentsIosPlotTabId1" className="flext-center non-selectable"
            style={{minHeight:120}}
            onLoad= {add_plot_with_latency_botAxis("CommentsIosPlotTabId1","ios","Rating5","#7E0DFF",5)}>
            <CircularProgress/>
          </Grid>
          <Grid item xs={12} sm={12} id="CommentsIosPlotTabId2" className="flext-center non-selectable"
            style={{minHeight:120}}
            onLoad= {add_plot_with_latency_botAxis("CommentsIosPlotTabId2","ios","Rating4","#A600EB",4)}>
            <CircularProgress/>
          </Grid>
          <Grid item xs={12} sm={12} id="CommentsIosPlotTabId3" className="flext-center non-selectable"
            style={{minHeight:120}}
            onLoad= {add_plot_with_latency_botAxis("CommentsIosPlotTabId3","ios","Rating3","#F200FF",3)}>
            <CircularProgress/>
          </Grid>
          <Grid item xs={12} sm={12} id="CommentsIosPlotTabId4" className="flext-center non-selectable"
            style={{minHeight:120}}
            onLoad= {add_plot_with_latency_botAxis("CommentsIosPlotTabId4","ios","Rating2","#EB0098",2)}>
            <CircularProgress/>
          </Grid>
          <Grid item xs={12} sm={12} id="CommentsIosPlotTabId5" className="flext-center non-selectable"
            style={{minHeight:120}}
            onLoad= {add_plot_with_latency_botAxis("CommentsIosPlotTabId5","ios","Rating1","#FF0034",1)}>
            <CircularProgress/>
          </Grid>
        </Grid>
      </Grid>
    </>
  );
}