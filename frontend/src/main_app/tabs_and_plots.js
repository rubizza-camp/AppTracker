// jshint esversion:9
import React from 'react';
import PropTypes from 'prop-types';
import { makeStyles } from '@material-ui/core/styles';
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import Grid from '@material-ui/core/Grid';
import Icon from '@material-ui/core/Icon';
import SwipeableViews from 'react-swipeable-views';
import CommentsPlotTab from './tabpanel_plot_elements/comments_tab.js';
import DownloadsPlotTab from './tabpanel_plot_elements/downloads_tab.js';
import RankPositionsPlotTab from './tabpanel_plot_elements/rank_positions_tab.js';

function TabPanel(props) {
  const { children, value, index, ...other } = props;

  return (
    <Typography
      component="div"
      role="tabpanel"
      hidden={value !== index}
      id={`vertical-tabpanel-${index}`}
      aria-labelledby={`vertical-tab-${index}`}
      {...other}
    >
      <Box p={3}>{children}</Box>
    </Typography>
  );
}

TabPanel.propTypes = {
  children: PropTypes.node,
  index: PropTypes.any.isRequired,
  value: PropTypes.any.isRequired,
};

function a11yProps(index) {
  return {
    id: `vertical-tab-${index}`,
    'aria-controls': `vertical-tabpanel-${index}`,
  };
}

const useStyles = makeStyles(theme => ({
  root: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
    display: 'flex',
    height: 224,
  },
  tabs: {
    borderRight: `1px solid ${theme.palette.divider}`,
  },
}));

export default function VerticalTabs() {
  const classes = useStyles();
  const [value, setValue] = React.useState(0);

  function handleChange(event, newValue) {
    setValue(newValue);
  }
  function handleChangeIndex(index) {
    setValue(index);
  }

  return (
    <>
      <Grid item xs={12} sm={12}>
        <div className='card-covei'>
          <Tabs
            value={value}
            onChange={handleChange}
            indicatorColor="primary"
            textColor="primary"
            centered
          >
            <Tab icon={<Icon className="material-icons-outlined">thumbs_up_down</Icon>} label="COMMENTS RATINGS" className="unset-max-width" {...a11yProps(0)} />
            <Tab icon={<Icon className="material-icons-outlined">save_alt</Icon>} label="DOWNLOADS" className="unset-max-width" {...a11yProps(1)} />
            <Tab icon={<Icon className="material-icons-outlined">stars</Icon>} label="RANK POSITIONS" className="unset-max-width" {...a11yProps(2)} />
          </Tabs>
        </div>
      </Grid>
      <Grid item xs={12} sm={12}>
        <div className='card-covei'>
          <SwipeableViews
            axis={'x'}
            index={value}
            onChangeIndex={handleChangeIndex}
          >
            <TabPanel value={value} index={0} className="plot-covei">
              <CommentsPlotTab></CommentsPlotTab>
            </TabPanel>
            <TabPanel value={value} index={1} className="plot-covei">
              <DownloadsPlotTab></DownloadsPlotTab>
            </TabPanel>
            <TabPanel value={value} index={2} className="plot-covei">
              <RankPositionsPlotTab></RankPositionsPlotTab>
            </TabPanel>
          </SwipeableViews>
        </div>
      </Grid>
    </>
  );
}