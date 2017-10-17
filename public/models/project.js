"use strict";

function Project(title, id, deleted) {
    this.id = id;
    this.issues = [];
    this.title = title || "";
    this.deleted = deleted || null;
}

Project.prototype.add = function() {

};