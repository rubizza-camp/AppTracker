import React from 'react';
import axios from 'axios';
import {Cell, Grid, Row} from '@material/react-layout-grid';
import Paper from '@material-ui/core/Paper';
import InputBase from '@material-ui/core/InputBase';
import Divider from '@material-ui/core/Divider';
import IconButton, {IconToggle} from '@material/react-icon-button';
import MaterialIcon from '@material/react-material-icon';
import ReactSVG from 'react-svg'
import ReactDOM from 'react-dom'
import Rating from '@material-ui/lab/Rating';

import MainAppField from '../main_app/main_app_field.js';

import '@material/react-list/dist/list.css';

import List, {ListItem, ListItemText} from '@material/react-list';

import "@material/icon-button/dist/mdc.icon-button.css";

import '@material/react-layout-grid/dist/layout-grid.css';

import '@material/react-material-icon/dist/material-icon.css';
import '@material/react-icon-button/dist/icon-button.css';

import './search_element.css';

function startLoadAppInfo(name)
{
  axios.get('https://'+'apptracker.club'+':3000/api/v1/apps/'+name)
    .then(response =>
    {
      window.globalAppData = response.data;
      ReactDOM.render(React.createElement(MainAppField),document.getElementById("root"));
      document.getElementById("root").setAttribute("style","align-self: center;")
      console.log(window.globalAppData);
    })
};

const newPartElement = (element_data, id) =>

  <ListItem key = {id} style={{borderRadius: '50px', marginLeft: "5px", paddingLeft: "5px"}}
    onClick = {()=>{
      // window.location.href = element_data.google_play_link;
      if (!document.getElementById('MainSearchEl').classList.contains('hide_transition'))
      {
        document.getElementById('MainSearchEl').classList.remove('show_transition');
        document.getElementById('MainSearchEl').classList.add('hide_transition');
        setTimeout(()=>{
          //Начинаем выгрузку данных
          startLoadAppInfo(element_data.title);
        },100);
      }
    }}
  >
    <div style= {{
      height: "40px",
      width: "40px",
      borderRadius: "100%",
      backgroundImage: "url('"+element_data.icon_url+"')",
      backgroundSize: "cover",
    }}></div>
    <ListItemText className = "ml-10 unhover" primaryText={element_data.title} />
    <div style= {{
      marginLeft: "auto"
      }}>
      <Rating style={{color: '#606060'}} value={4.5} readOnly />
    </div>
  </ListItem>;

class SearchEl extends React.Component
{
  create_search_result_fields(data)
  {
    if (data.length != 0)
    {
      var components = [];
      components.push(<Divider key='divider' style={{ width: "74%", height: 1, marginBottom: "11px", marginLeft: "12%",marginRight: "12%" }} />)
      for (var i = 0; i < data.length; i++) components.push(newPartElement(data[i], i));
      const newFieldCount = React.createElement(
        List,
        {id: 'some', className: 'non-selectable'},
        components);
      ReactDOM.render(
        newFieldCount,
        document.getElementById('search_field')
      );
    }
    else
    {
      ReactDOM.render(
        '',
        document.getElementById('search_field')
      );
    }
  }

  search_request = (event) =>
  {
    if (this.searchTimer != undefined)
    {
      clearTimeout(this.searchTimer);
      this.searchTimer = undefined;
    }

    var target = event.currentTarget;
    if (target.value != "")
    {
      this.searchTimer = setTimeout(()=>{
        // axios.get('https://'+document.domain+':3000/api/v0/packages?name='+target.value)
        axios.get('https://'+'apptracker.club'+':3000/api/v1/apps?title='+target.value)
        .then(response => {
          if (document.getElementById('MainSearchInputField').value != "")
          this.create_search_result_fields(response.data);
        })
        .catch(error => console.log(error))
      },100);
    }
    else
    {
      ReactDOM.render(
        '',
        document.getElementById('search_field')
      );
    }
  }

  render()
  {
    return (
      // <MainAppField></MainAppField>
      <Grid style= {{width: '98vw', maxWidth: '600px', marginTop: '32vh'}}>
        <Row>
          <Cell className='flext-center' columns={12}>
            <ReactSVG style= {{minWidth: "250px", width:"50%", padding:"15px"}} src="Icons/AppTrackerTitleColored.svg" />
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
                <IconButton style={{color:"#EB7659"}} className="material-icons-outlined">
                    more_vert
                  </IconButton>
                  <InputBase
                  autoComplete = 'off'
                  id = 'MainSearchInputField'
                  onChange= {this.search_request}
                  style={{ marginLeft: 8, flex: 1, }}
                  placeholder="Search application"
                  inputProps={{ 'aria-label': 'Search application' }}
                />
                <IconButton style={{color:"#9900FF"}} className="material-icons-outlined">
                  search
                </IconButton>
                <Divider style={{ width: 1, height: 28, margin: 4, }} />
                <IconButton style={{color:"#141414b0"}} className="material-icons-outlined">
                  error_outline
                </IconButton>
              </Paper>
              
              <div id="search_field" style={{maxHeight: "30vh", overflowY: "scroll"}}>
              </div>
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

export default SearchEl;