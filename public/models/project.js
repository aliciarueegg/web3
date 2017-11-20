"use strict";

function Project(title,id,created_at,updated_at,active) {
    this.title = title || "";
    this.id = id || 0;
    this.created_at = created_at || createDateAndTime();
    this.updated_at = created_at || createDateAndTime();
    this.active = active || false;
    this.issues = [];
}

Project.prototype.addIssue = function(issue) {
    this.issues.push(issue);
};

function createDateAndTime (){
    var date = new Date();
    var month = date.getMonth()+1;
    return date.getFullYear() + "-" + month + "-" + date.getDay() +  "T" + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() + "." + date.getMilliseconds() + "Z";
}