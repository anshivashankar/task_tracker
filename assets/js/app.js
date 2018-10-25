// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html";
import jQuery from 'jquery';
window.jQuery = window.$ = jQuery;
import "bootstrap";
import _ from 'lodash';

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

// below code inspired by: http://www.ccs.neu.edu/home/ntuck/courses/2018/09/cs4550/notes/13-ajax/notes.html

var started = false;
var start_time

$(function () {
  $('#time-block-button').click((ev) => {
    let current_user_id = $(ev.target).data('user-id');
    //let start_time = $(ev.target).data('start_time');
    //let end_time = $(ev.target).data('end_time');
    let task_id = $(ev.target).data('task-id');
    let end_time;
    if(!started) {
      start_time = new Date();
      started = true;
      $('#time-block-button').text(`End time block`);
    }
    else {
      end_time = new Date();
      started = false;
      //let task_id = $(ev.target).data('product-id');
      let text = JSON.stringify({
        time_block: {
          start_time: start_time,
          end_time: end_time,
          task_id: task_id,
        },
      });

      $.ajax(time_block_path, {
        method: "post",
        dataType: "json",
        contentType: "application/json; charset=UTF-8",
        data: text,
        success: (resp) => {
          $('#time-block-button').text(`Start time block`);
        },
      });
    }
  });
});

