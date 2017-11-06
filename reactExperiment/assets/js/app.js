// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import React from 'react';
import ReactDOM from 'react-dom';

import SortableSimple from './components/index';

function ready(channel, state0) {
    let root = document.getElementById('root');
    ReactDOM.render(<SortableSimple channel={channel} state={state0} />, root);
}


function start() {

  let channel = socket.channel("group: " + window.user_name, {})
  channel.join()
    .receive("ok", state0 => {
        console.log("Joined successfully", state0)
        ready(channel, state0)
    })
    .receive("error", resp => { console.log("Unable to join", resp) })
}

$(start);
