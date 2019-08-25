// jshint esversion:9
import React from 'react';
import Grid from '@material-ui/core/Grid';
import ListSubheader from '@material-ui/core/ListSubheader';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import './App.css';
import SearchEl from './main_search_element/search_element.js';

class MyApp extends React.Component {
  render()
  {
    return (
      <>
        <div id='MainSearchEl' className='show_transition flext-center'>
          <SearchEl>
          </SearchEl>
        </div>
        <div className='footer'>
          <Grid container>
            <Grid item xs={3} sm={3}>
              1
            </Grid>
            <Grid item xs={3} sm={3}>
              2
            </Grid>
            <Grid item xs={3} sm={3}>
              3
            </Grid>
            <Grid item xs={3} sm={3}>
              4
            </Grid>
          </Grid>
        </div>
      </>
    );
  }
}

export default MyApp;
