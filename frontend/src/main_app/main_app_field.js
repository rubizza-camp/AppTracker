// jshint esversion:9
import React from 'react';
import ReactSVG from 'react-svg'
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import MinSearchEl from './min_search_element/min_search_element.js';
import VerticalTabs from './tabs_and_plots.js';
import './main_app_field.css';

const useStyles = makeStyles(theme => ({
  root: {
    flexGrow: 1,
  },
  control: {
    padding: theme.spacing(2),
  },
}));

export default function MainAppField() {
  const [spacing, setSpacing] = React.useState(2);
  const classes = useStyles();

  function handleChange(event, value) {
    setSpacing(Number(value));
  }

  return (
    <Grid container className={classes.root} spacing={2} style={{width: "90vw", maxWidth: "900px"}}>
      <Grid item xs={12}>
        <Grid container justify="center" spacing={spacing}>
          <Grid item xs={12} sm={4} className="flext-center">
            <ReactSVG style= {{width:"80%", maxWidth: "250px", minWidth: "180px "}} src="Icons/AppTrackerTitleColored.svg" />
          </Grid>
          <Grid item xs={12} sm={8} className="flext-center">
            <MinSearchEl>
            </MinSearchEl>
          </Grid>
          <VerticalTabs></VerticalTabs>
        </Grid>
      </Grid>
    </Grid>
  );
}

// class MainAppField extends React.Component
// {
//   increment()
//   {
//     if (window.mainAppFieldKey == undefined)
//     {
//       window.mainAppFieldKey = 1;
//     }
//     else
//     {
//       window.mainAppFieldKey++;
//     }
//     return window.mainAppFieldKey
//   }
//   render()
//   {
//     return (
//       <div key={this.increment()} id='MainAppField' className='d-flex justify-content-center align-items-center' style={{width: '100vw', maxWidth: '900px'}}>
//         <Grid container>
//           <Grid item xs={4} justifyContent="center">
//             
//           </Grid>
//           <Grid item xs={8} alignItems="center" justifyContent="center" className="diplayFlex">
//               
//           </Grid>
//           {/* <Grid item xs={12}>
//             <div className='card-covei' style = {{ height: 'auto'}}>
//               qwe
//             </div>
//           </Grid>
//           <Grid item xs={12}>
//             <div id='float3Dsettings' className='card-covei' style = {{ height: '60vh'}}>
//               <div className='d-flex justify-content-center align-items-center' style = {{width: '100%', height: '100%'}}>
//                 <CircularProgress  disableShrink/>
//               </div>
//             </div>
//           </Grid>
//           <Grid item xs={8} >
//             <div className='card-covei' style = {{ height: '100%', minHeight: 400}}>
//               wert
//             </div>
//           </Grid> */}
//         </Grid>
//       </div>
//     );
//   }
// }

// export default MainAppField;
