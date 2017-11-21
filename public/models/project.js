"use strict";

class Project {
    constructor(title,id,created_at,updated_at,active)
    {
        this.title = title || "";
        this.id = id || 0;
        this.created_at = created_at || createDateAndTime();
        this.updated_at = created_at || createDateAndTime();
        this.active = active || false;
        this.issues = [];
    }

    createDateAndTime ()
    {
        var date = new Date();
        var month = date.getMonth()+1;
        return date.getFullYear() + "-" + month + "-" + date.getDay() +  "T" + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() + "." + date.getMilliseconds() + "Z";
    }


    addIssue(issue)
    {
        save();
    }

    toggleActive() {}
}

