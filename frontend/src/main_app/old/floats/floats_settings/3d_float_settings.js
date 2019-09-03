import React from 'react';
import Typography from '@material-ui/core/Typography';
import Slider from '@material-ui/core/Slider';
import Select, {Option} from '@material/react-select';

import Button from '@material/react-button';
import MaterialIcon from '@material/react-material-icon/';

import MenuSurface, {Corner} from '@material/react-menu-surface';

import '@material/react-list/dist/list.min.css';
import '@material/react-menu-surface/dist/menu-surface.min.css';
import '@material/react-menu/dist/menu.min.css';
import '@material/react-select/dist/select.min.css';
import '@material/react-button/dist/button.css';

class PlotAdditionalOptions extends React.Component {
  state = {
    open: false,
    anchorElement: null,
  };

  setAnchorElement = (element) => {
    if (this.state.anchorElement) {
      return;
    }
    this.setState({anchorElement: element});
  }

  render() {
    return (
      <div
        className='mdc-menu-surface--anchor'
        ref={this.setAnchorElement}
      >
        <Button
          style = {{width: '100%'}}
          className= 'non-selectable unhover mr-3 mt-2'
          onClick={() => this.setState({open: true})}
        >
          PLOT SETTINGS
        </Button>

        <MenuSurface
          open={this.state.open}
          anchorCorner={Corner.TOP_START}
          onClose={() => this.setState({open: false})}
          anchorElement={this.state.anchorElement}
          className='fit-card'
        >
          <Typography id="discrete-slider-restrict" gutterBottom>
            Specular
          </Typography>
          <Slider
            defaultValue={40}
            valueLabelFormat={valueLabelFormat}
            getAriaValueText={(value)=>{
              console.log(value);
            }}
            aria-labelledby="discrete-slider-restrict"
            step={null}
            valueLabelDisplay="auto"
            marks={marks}
          />
          <Typography id="discrete-slider-restrict" gutterBottom>
            Roughness
          </Typography>
          <Slider
            defaultValue={40}
            valueLabelFormat={valueLabelFormat}
            getAriaValueText={(value)=>{
              console.log(value);
            }}
            aria-labelledby="discrete-slider-restrict"
            step={null}
            valueLabelDisplay="auto"
            marks={marks}
          />
        </MenuSurface>
      </div>
    );
  }
}

class ZAxisSelecter extends React.Component {
  state = {value: 'Downloads'};

  onEnhancedChange = (index, item) => (
    this.setState({value: item.getAttribute('data-value')})
  );

  render() {
    return (
      <Select
        className = 'mt-2'
        enhanced
        outlined
        label='z axis variable'
        value={this.state.value}
        onEnhancedChange={this.onEnhancedChange}
      >
        <Option value='Downloads'>Downloads</Option>
        <Option value='Rank'>Rank</Option>
        <Option value='Country'>Country</Option>
      </Select>
    );
  }
}

class XAxisSelecter extends React.Component {
  state = {value: 'TotalRating'};

  onEnhancedChange = (index, item) => (
    this.setState({value: item.getAttribute('data-value')})
  );

  render() {
    return (
      <Select
        className = 'mt-2'
        enhanced
        outlined
        label='x axis variable'
        value={this.state.value}
        onEnhancedChange={this.onEnhancedChange}
      >
        <Option value='Rating1'>Star 1</Option>
        <Option value='Rating2'>Star 2</Option>
        <Option value='Rating3'>Star 3</Option>
        <Option value='Rating4'>Star 4</Option>
        <Option value='Rating5'>Star 5</Option>
        <Option value='TotalRating'>Total stars</Option>
        <Option value='AverageRating'>Average rating</Option>
      </Select>
    );
  }
}

const marks = [
  {
    value: 0,
    label: '0%',
  },
  {
    value: 40,
    label: '40%',
  },
  {
    value: 70,
    label: '70%',
  },
  {
    value: 100,
    label: '100%',
  },
];

function valuetext(value) {
  console.log(value)
}

function valueLabelFormat(value) {
  return marks.findIndex(mark => mark.value === value) + 1;
}

export default function DiscreteSlider(newEl) {

  return (
    <div className='m-3 mr-4 ml-4'>
      <ZAxisSelecter></ZAxisSelecter>
      <XAxisSelecter></XAxisSelecter>
      <PlotAdditionalOptions></PlotAdditionalOptions>
    </div>
    
  );
}