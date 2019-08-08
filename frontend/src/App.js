import React from 'react';
import {Cell, Grid, Row} from '@material/react-layout-grid';
import Paper from '@material-ui/core/Paper';
import InputBase from '@material-ui/core/InputBase';
import Divider from '@material-ui/core/Divider';
import IconButton, {IconToggle} from '@material/react-icon-button';
import MaterialIcon from '@material/react-material-icon';
import ReactSVG from 'react-svg'

import '@material/react-list/dist/list.css';

import List, {ListItem, ListItemText} from '@material/react-list';

import "@material/icon-button/dist/mdc.icon-button.css";

import '@material/react-layout-grid/dist/layout-grid.css';

import '@material/react-material-icon/dist/material-icon.css';
import '@material/react-icon-button/dist/icon-button.css';
import './App.css';

class MyApp extends React.Component {

  search_request = (event) =>
  {
    if (this.searchTimer != undefined) clearTimeout(this.searchTimer);
    var target = event.currentTarget;
    this.searchTimer = setTimeout(()=>{
      if (target.value != "")
      {

      }
      //1. Инициализируем поиск элемента
      //2. Обновляем таблицу найденных паков
    },250);
  }
  render() {

    return (
      <Grid style= {{width: '98vw', maxWidth: '700px', paddingBottom: '70px'}}>
        <Row>
          <Cell className='flext-center' columns={12}>
            <ReactSVG style= {{width:"50%", padding:"15px"}} src="Icons/AppTrackerTitleColored.svg" />
          </Cell>
        </Row>
        <Row>
          <Cell columns={12}>
            <div style= {{padding: '4px 4px', borderRadius: '28px', overflow: 'hidden',}}
                className = "mdc-elevation--z5">
              <Paper style= {{borderRadius: 'none !important', boxShadow: 'none',
                display: 'flex',
                alignItems: 'center',
                }}>
                  <IconButton>
                    <IconToggle isOn>
                      <MaterialIcon style={{color:"#9900FF"}} className="material-icons-outlined" icon='chevron_left' />
                    </IconToggle>
                    <IconToggle>
                      <MaterialIcon style={{color:"#EB7659"}} className="material-icons-outlined" icon='more_vert' />
                    </IconToggle>
                  </IconButton>
                  <InputBase
                  onChange= {this.search_request}
                  style={{ marginLeft: 8, flex: 1, }}
                  placeholder="Search application"
                  inputProps={{ 'aria-label': 'Search application' }}
                />
                  <button style={{color:"#9900FF"}} className="mdc-icon-button material-icons-outlined">search</button>
                <Divider style={{ width: 1, height: 28, margin: 4, }} />
                <IconButton>
                  <IconToggle isOn>
                    <MaterialIcon style={{color:"#141414b0"}} className="material-icons-outlined" icon='error' />
                  </IconToggle>
                  <IconToggle>
                    <MaterialIcon style={{color:"#141414b0"}} className="material-icons-outlined" icon='error_outline' />
                  </IconToggle>
                </IconButton>
              </Paper>
              
              {/* <Divider style={{ width: "74%", height: 1, marginLeft: "12%",marginRight: "12%" }} />

              <List>
                <ListItem>
                  <ListItemText primaryText='Photos'/>
                </ListItem>
                <ListItem>
                  <ListItemText primaryText='Recipes'/>
                </ListItem>
                <ListItem>
                  <ListItemText primaryText='Work'/>
                </ListItem>
              </List> */}
            </div>
            
          </Cell>
        </Row>
        <Row>
          <Cell columns={12}>
            
          </Cell>
        </Row>
      </Grid>
    );
  }
}


export default MyApp;
