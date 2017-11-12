"use strict";

function Project(title,id,created_at,updated_at,active) {
    this.title = title || "";
    this.id = id || 0;
    this.created_at = created_at || createDateAndTime();
    this.updated_at = created_at || createDateAndTime();
    this.active = active || true;
    this.issues = [];
}

Project.prototype.add = function() {

};

function createDateAndTime (){
    var date = new Date();
    var month = date.getMonth()+1;
    return date.getFullYear() + "-" + month + "-" + date.getDay() +  "T" + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() + "." + date.getMilliseconds() + "Z";
}