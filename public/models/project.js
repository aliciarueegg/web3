"use strict";

function Project(id,created_at,updated_at,title,active) {
    this.id = id;
    this.created_at = created_at || createDateAndTime();
    this.updated_at = created_at || createDateAndTime();
    this.title = title || "";
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