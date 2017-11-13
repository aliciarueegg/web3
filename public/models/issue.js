"use strict";

function Issue(title,done,updated_at,project_client_id,priority,id,client_id,project_id,created_at) {
    this.title = title;
    this.done = done || false;
    this.updated_at = updated_at || createDateAndTime();
    this.project_client_id = project_client_id;
    this.priority = priority || 0;
    this.id = id || 0;
    this.client_id = client_id
    this.project_id = project_id;
    this.created_at = created_at || createDateAndTime();
}

Issue.prototype.add = function() {

};

function createDateAndTime (){
    var date = new Date();
    var month = date.getMonth()+1;
    return date.getFullYear() + "-" + month + "-" + date.getDay() +  "T" + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() + "." + date.getMilliseconds() + "Z";
}