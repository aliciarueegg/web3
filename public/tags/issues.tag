<issues>
    <div if={ opts.active_project } class="container" id="new-issues">
        <h2> New Issue </h2>

        <div class="row">
            <form id="issueForm1" onsubmit={ add_issue }>
                <div class="form-row">

                    <div class="form-group col-md-3">
                        <label for="due_date">Due Date</label>
                        <input class="form-control" type="date" name="date" id="due_date">
                    </div>

                    <div class="form-group col-md-3">
                        <label>Priority</label>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input name="priority" class="form-check-input" type="radio" id="priority_normal" value="2" checked> 2
                            </label>
                            <label class="form-check-label">
                                <input name="priority" class="form-check-input" type="radio" id="priority_high" value="3"> 3
                            </label>
                            <label class="form-check-label">
                                <input name="priority" class="form-check-input" type="radio" id="priority_low" value="1"> 1
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="newIssueName">Title</label>

                        <div class="form-inline">
                            <input type="text" class="form-control" id="newIssueName" name="name" placeholder="new issue..." onkeyup={ edit } ref="input">
                            <button type="submit" class="btn btn-primary" id="save_issue" >Create issue</button>
                        </div>
                    </div>

                </div>
            </form>
        </div>

    </div>

    <div if={ opts.active_project } class="container" id="current-issues">
        <h2> Issues </h2>

        <table class="table">
            <thead>
                <tr>
                    <th></th>
                    <th>Priority</th>
                    <th>Issue</th>
                    <th>Due Date</th>
                    <th>Edit</th>
                </tr>
            </thead>

            <tbody>
                <tr each={ issuesOfProject }>
                    <th><input id="checkBox_issue1" type="checkbox" checked={ done } onclick = { toggleDone } ></th>
                    <td class="{ done: done }"> { priority } </td>
                    <td class="{ done: done }"> { title } </td>
                    <td class="{ done: done }"> { due_date.substring(0,10) } </td>
                    <td><button onclick = { deleteIssue }><i class="fa fa-trash"></i></button></td>
                </tr>
            </tbody>
        </table>
    </div>

    <script>
        this.active_project = opts.active_project;

        edit(e)
        {
            this.new_issue_name = e.target.value;
        }

        get_due_date() {
            var t = "T00:00:00.000Z";
            if ($("#due_date").val()) {
                return $("#due_date").val() + t;
            }
            var d = new Date();
            return 1900 + d.getYear() + "-" + d.getMonth() + "-" + d.getDate() + t;
        }

        add_issue(e)
        {
            e.preventDefault();
            var thisProjects = this.parent.projects;
            var issue = new Issue(this.new_issue_name);
            issue.due_date = this.get_due_date();
            issue.priority = $("input[name=priority]:checked").val();
            $.ajax({
                url: baseURL + "projects/" + this.parent.projects.active_project.id + "/issues",
                method: "POST",
                data: JSON.stringify(issue),
                dataType:"JSON",
                contentType:"application/json",
                success: function(data) {
                    thisProjects.active_project.issues.push(data);
                    thisProjects.save();
                    riot.update();
                },
                complete: function() {
                    console.log('Ajax call completed');
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log('status: ' + xhr.status);
                    console.log('ERROR: ' + thrownError);
                }
            });

            this.new_project_name = this.refs.input.value = '';
        }

        this.on('before-mount', function(){
            this.active_project = this.parent.projects.active_project;
            this.issuesOfProject = (this.active_project != null) ? this.active_project.issues : []
        });

        this.on('update', function() {
            if (this.parent.projects.active_project != null)
            {
                this.issuesOfProject = this.parent.projects.active_project.issues;
            }
        });

        deleteIssue(e)
        {
            this.clientIssueId = e.item.client_id;
            var thisProject = this.parent.projects.active_project;

            for (var  i = 0; i < thisProject.issues.length; i++)
            {
                var issue = thisProject.issues[i];

                if (issue.client_id == this.clientIssueId) {

                    $.ajax({
                        url: baseURL + "projects/" + thisProject.id + "/issues/" + issue.id,
                        method: "DELETE",
                        dataType:"JSON",
                        complete: function() {
                            console.log('Ajax call completed');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            console.log('status: ' + xhr.status);
                            console.log('ERROR: ' + thrownError);
                        }
                    });

                    this.parent.projects.active_project.issues.splice(i, 1);
                }
            }

            this.parent.projects.save();
        }

        toggleDone(e)
        {
            this.clientIssueId = e.item.client_id;
            var thisProject = this.parent.projects.active_project;

            for (var  i = 0; i < thisProject.issues.length; i++)
            {
                var issue = thisProject.issues[i];

                if (issue.client_id == this.clientIssueId) {
                    issue.done = !issue.done;
                    $.ajax({
                        url: baseURL + "projects/" + thisProject.id + "/issues/" + issue.id,
                        method: "PUT",
                        data: JSON.stringify(issue),
                        dataType:"JSON",
                        contentType:"application/json",
                        complete: function() {
                            console.log('Ajax call completed');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            console.log('status: ' + xhr.status);
                            console.log('ERROR: ' + thrownError);
                        }
                    });
                }
            }

            this.parent.projects.save();
        }

    </script>
</issues>

