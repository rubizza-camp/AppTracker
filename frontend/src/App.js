import React from 'react';

import './App.css';


import SearchEl from './main_search_element/search_element.js';

class MyApp extends React.Component {
  render()
  {
    return (
      <div id='MainSearchEl' className='show_transition flext-center'>
        <SearchEl>
        </SearchEl>
      </div>
    );
  }
}

export default MyApp;
