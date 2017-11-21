"use strict";

class Project {
    constructor(title,id,active)
    {
        this.title = title || "";
        this.id = id || 0;
        this.created_at = this.createDateAndTime();
        this.updated_at = this.createDateAndTime();
        this.active = active || false;
        this.issues = [];
        this.client_project_id = this.uuid();

    }

    createDateAndTime ()
    {
        var date = new Date();
        var month = date.getMonth()+1;
        return date.getFullYear() + "-" + month + "-" + date.getDay() +  "T" + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() + "." + date.getMilliseconds() + "Z";
    }


    addIssue(new_issue_name)
    {
            if (new_issue_name) {
                var issue = new Issue(new_issue_name);
                this.issues.push(issue);
            }
    }

    uuid()
    {
        function s4() {
            return Math.floor((1 + Math.random()) * 0x10000)
                .toString(16)
                .substring(1);
        }
        return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
            s4() + '-' + s4() + s4() + s4();
    }
}

