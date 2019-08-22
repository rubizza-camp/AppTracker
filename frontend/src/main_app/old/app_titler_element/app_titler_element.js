import React from 'react';

import IconButton from '@material/react-icon-button';
import MaterialIcon from '@material/react-material-icon/';

import '@material/react-menu-surface/dist/menu-surface.css';

import MenuSurface, {Corner} from '@material/react-menu-surface';
class AppIconButton extends React.Component {
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
        <IconButton
          className= 'non-selectable unhover mr-3'
          onClick={() => this.setState({open: true})}
          style = {{
            borderRadius: "500px",
            backgroundImage: "url('"+window.globalAppData.icon_url+"')",
            backgroundSize: "cover",}}>
          <MaterialIcon/>
        </IconButton>

        <MenuSurface
          open={this.state.open}
          anchorCorner={Corner.TOP_START}
          onClose={() => this.setState({open: false})}
          anchorElement={this.state.anchorElement}
          className='br-50 no-shadow covei-1'
        >
          <IconButton
            className= 'non-selectable unhover mr-2'
            onClick={() => {window.location.href = window.globalAppData.android_url;}}
            style = {{
              borderRadius: "500px",
              backgroundImage: "url(Icons/GooglePlayLogo.svg)",
              backgroundSize: "cover",}}>
            <MaterialIcon/>
          </IconButton>
          <IconButton
            className= 'non-selectable unhover mr-5'
            onClick={() => {window.location.href = window.globalAppData.apple_url;}}
            style = {{
              borderRadius: "500px",
              backgroundImage: "url(Icons/AppStoreIcon.jpg)",
              backgroundSize: "cover",}}>
            <MaterialIcon/>
          </IconButton>
        </MenuSurface>
      </div>
    );
  }
}

class AppTitlerEl extends React.Component
{
  render()
  {
    return(
      <Container>
        <Row className= 'p-2 d-flex align-items-center'>
            <AppIconButton></AppIconButton>
            {window.globalAppData.title}
        </Row>
      </Container>
    )
  }
}
export default AppTitlerEl;