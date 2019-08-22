import React from 'react';
import Grid from '@material-ui/core/Grid';
import CircularProgress from '@material-ui/core/CircularProgress';

export default function RankPositionsPlotTab() {
  return (
    <>
      <Grid item xs={12} sm={12} id="RankPositionsPlotTabId" className="flext-center"
        style={{minHeight:300}}>
        
        <CircularProgress/>
      </Grid>
    </>
  );
}