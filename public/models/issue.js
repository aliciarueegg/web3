"use strict";

class Issue {
    constructor(title,done,project_client_id,priority,id,project_id) {
        this.title = title;
        this.done = done || false;
        this.updated_at = this.createDateAndTime();
        this.project_client_id = this.uuid();
        this.priority = priority || 0;
        this.id = id || 0;
        this.client_id = this.uuid();
        this.project_id = project_id;
        this.created_at = this.createDateAndTime();
        this.due_date = "0";
    }

    createDateAndTime () {
        var date = new Date();
        var month = date.getMonth()+1;
        return date.getFullYear() + "-" + month + "-" + date.getDate() +  "T" + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() + "." + date.getMilliseconds() + "Z";
    }

    uuid() {
        function s4() {
            return Math.floor((1 + Math.random()) * 0x10000)
                .toString(16)
                .substring(1);
        }
        return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
            s4() + '-' + s4() + s4() + s4();
    }

}