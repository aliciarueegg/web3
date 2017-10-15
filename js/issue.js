"use strict";

function Issue(title, done, deleted, createDate) {
    this.done = done || false;
    this.deleted = deleted || false;
    this.title = title || "";
    this.createDate = createDate;
}

Issue.prototype.add = function() {

};