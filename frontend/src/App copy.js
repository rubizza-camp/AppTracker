import React from 'react';
import {Cell, Grid, Row} from '@material/react-layout-grid';
import Card, {
  CardPrimaryContent,
  CardMedia,
  CardActions,
  CardActionButtons,
  CardActionIcons
} from "@material/react-card";
import Tab from '@material/react-tab';
import TabBar from '@material/react-tab-bar';
import Paper from '@material-ui/core/Paper';
import InputBase from '@material-ui/core/InputBase';
import Divider from '@material-ui/core/Divider';
import IconButton, {IconToggle} from '@material/react-icon-button';
import MaterialIcon from '@material/react-material-icon';
import {ChipSet, Chip} from '@material/react-chips';
import List, {ListItem, ListItemText} from '@material/react-list';

import "@material/icon-button/dist/mdc.icon-button.css";

import '@material/react-tab-bar/dist/tab-bar.css';
import '@material/react-tab-scroller/dist/tab-scroller.css';
import '@material/react-tab/dist/tab.css';
import '@material/react-tab-indicator/dist/tab-indicator.css';

import '@material/react-layout-grid/dist/layout-grid.css';
import '@material/react-card/dist/card.css';

import '@material/react-material-icon/dist/material-icon.css';

import '@material/react-text-field/dist/text-field.css';

import '@material/react-typography/dist/typography.css';

import '@material/react-icon-button/dist/icon-button.css';

import "@material/react-chips/dist/chips.css";

import '@material/react-list/dist/list.css';

import "@material/react-checkbox/dist/checkbox.css";

import {
  Body1,
  Body2,
  Button,
  Caption,
  Headline1,
  Headline2,
  Headline3,
  Headline4,
  Headline5,
  Headline6,
  Overline,
  Subtitle1,
  Subtitle2,
} from '@material/react-typography';

import './App.css';

class MyApp extends React.Component {
  state = {activeIndex: 0};

  handleActiveIndexUpdate = (activeIndex) => 
  {
    this.setState({activeIndex});
    var tabs_divs = document.getElementsByClassName("mdc-card-div")
    for (var i = 0; i < tabs_divs.length; i++)
    {
      if (activeIndex == i)
      {
        tabs_divs[i].classList.add("mdc-card-div-visible");
        tabs_divs[i].classList.remove("mdc-card-div-invisible");
      }
      else
      {
        tabs_divs[i].classList.add("mdc-card-div-invisible");
        tabs_divs[i].classList.remove("mdc-card-div-visible");
      }
    }
  }

  stateSearchChips = {
    selectedIndex: [1],
  };

  render() {

    return (
      <Grid style= {{ paddingBottom: "70px" }}>
        <Row>
          <Cell columns={12}>
            <Headline4 style = {{ textAlign:"center", marginTop: "10px", marginBottom :"10px" }}>AppTracker</Headline4>
            <Headline6 style = {{ fontSize: "1.00rem",textAlign:"center", marginTop: "10px", marginBottom :"10px" }}>WE ARE YOUR SOURCE OF TRUTH FOR APPLICATIONS</Headline6>
          </Cell>
          <Cell columns={12}>
            <Card className = "mdc-elevation--z9">
              <TabBar
              activeIndex={this.state.activeIndex}
              handleActiveIndexUpdate={this.handleActiveIndexUpdate}
              >
                <Tab>
                  <span className="mdc-tab__content">
                    <span className="mdc-tab__icon material-icons-outlined" aria-hidden="true">search</span>
                    <span className="mdc-tab__text-label">Search</span>
                  </span>
                </Tab>
                <Tab>
                  <span className="mdc-tab__content">
                    <span className="mdc-tab__icon material-icons-outlined" aria-hidden="true">star_border</span>
                    <span className="mdc-tab__text-label">Top apps</span>
                  </span>
                </Tab>
                <Tab>
                  <span className="mdc-tab__content">
                    <span className="mdc-tab__icon material-icons-outlined" aria-hidden="true">cloud</span>
                    <span className="mdc-tab__text-label">About us</span>
                  </span>
                </Tab>
              </TabBar>
              <div className="mdc-card-div mdc-card-div-visible" id="Tab0">
                <ChipSet className="flext-center"
                  filter
                  selectedChipIds={this.stateSearchChips.selectedChipIds}
                  handleSelect={(selectedChipIds) => this.setState({selectedChipIds})}
                >
                  <Chip id={'chip1'} label='google play' />
                  <Chip id={'chip2'} label='app store' />
                  <Chip id={'chip3'} label='amazon apps' />
                </ChipSet>
                <Paper style= {{padding: '2px 4px',
                  display: 'flex',
                  alignItems: 'center',
                  }}>
                    <IconButton>
                      <IconToggle isOn>
                        <MaterialIcon className="material-icons-outlined" icon='chevron_left' />
                      </IconToggle>
                      <IconToggle>
                        <MaterialIcon className="material-icons-outlined" icon='more_vert' />
                      </IconToggle>
                    </IconButton>
                  <InputBase
                    style={{ marginLeft: 8, flex: 1, }}
                    placeholder="Search application"
                    inputProps={{ 'aria-label': 'Search application' }}
                  />
                    <button className="mdc-icon-button material-icons-outlined">search</button>
                  <Divider style={{ width: 1, height: 28, margin: 4, }} />
                  <IconButton>
                    <IconToggle isOn>
                      <MaterialIcon className="material-icons-outlined" icon='error_outline' />
                    </IconToggle>
                    <IconToggle>
                      <MaterialIcon className="material-icons-outlined" icon='error' />
                    </IconToggle>
                  </IconButton>
                </Paper>

              </div>
              <div className="mdc-card-div mdc-card-div-invisible" id="Tab1">
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
                  <ListItem>
                    <ListItemText primaryText='Photos'/>
                  </ListItem>
                  <ListItem>
                    <ListItemText primaryText='Recipes'/>
                  </ListItem>
                  <ListItem>
                    <ListItemText primaryText='Work'/>
                  </ListItem>
                  <ListItem>
                    <ListItemText primaryText='Photos'/>
                  </ListItem>
                  <ListItem>
                    <ListItemText primaryText='Recipes'/>
                  </ListItem>
                  <ListItem>
                    <ListItemText primaryText='Work'/>
                  </ListItem>
                </List>
              </div>
              <div className="mdc-card-div mdc-card-div-invisible" id="Tab2">
                Content2
              </div>
            </Card> 
          </Cell>
        </Row>
      </Grid>
    );
  }
}


export default MyApp;
