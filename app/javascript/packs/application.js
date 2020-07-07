// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap'

window.onload = () => {
    function reaplyRequest() {
        var from = document.getElementById("from-email").innerHTML
        console.log(from)
        from = from.split(" ")[3]
        var data = {
            "to": from
        }

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "http://localhost:3000/emails/compose",
            data: JSON.stringify(data),
            success: () => {
                window.location.href = "/emails/compose"
            }
        })
    }

    function showEmail() {
        var message_id = this.childNodes[7].textContent
        var data = {
            "message_id": message_id
        }
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "http://localhost:3000/emails/fetch",
            data: JSON.stringify(data),
            success: () => {
                window.location.href = "/emails/show"
            }
        })
    }

    function sendRequest() {
        var username = this.innerHTML
        var parent = this.parentNode.parentNode.parentNode.parentNode
        var message_id = parent.getElementsByClassName("message_id")[0].innerHTML
        var data = {
            "username": username,
            "message_id": message_id
        }
        // console.log(message_id)
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "http://localhost:3000/inbox/assign",
            data: JSON.stringify(data),
            success: () => alert("Success")
        })
    }
    
    var elements = document.getElementsByClassName("usernames")
    
    for (var i=0; i<elements.length; i++) {
        elements[i].addEventListener("click", sendRequest, false)
    }
    
    var emails = document.getElementsByClassName("email")
    for (var i=0; i<emails.length; i++) {
        emails[i].addEventListener("click", showEmail, false)
    }

    var reply_button = document.getElementById("reply")
    reply_button.addEventListener("click", reaplyRequest, false)
}

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= require jquery3
//= require popper
//= require bootstrap-sprockets