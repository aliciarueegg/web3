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
                                <input name="priority" class="form-check-input" type="radio" id="priority_normal" value="Normal" checked> Normal
                            </label>
                            <label class="form-check-label">
                                <input name="priority" class="form-check-input" type="radio" id="priority_high" value="High"> High
                            </label>
                            <label class="form-check-label">
                                <input name="priority" class="form-check-input" type="radio" id="priority_low" value="Low"> Low
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
                    <td class="{ done: done }"> { due_date } </td>
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

        add_project(e)
        {
            e.preventDefault();
            var postProject = new Project(this.new_project_name);
            delete postProject.issues;
            var thisProjects = this.projects;
            $.ajax({
                url: baseURL + "projects",
                method: "POST",
                data: JSON.stringify(postProject),
                dataType:"JSON",
                contentType:"application/json",
                success: function(data) {
                    var project = data;
                    thisProjects.addProject(project);
                    riot.update();
                },
                complete: function() {
                    console.log('completed');
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log('status: ' + xhr.status);
                    console.log('ERROR: ' + thrownError);
                }
            });
            this.new_project_name = this.refs.input.value = '';
        }

        add_issue(e)
        {
            e.preventDefault();
            var issue = new Issue(this.new_issue_name);
            issue.due_date = $("#due_date").val() || "Some Day...";
            issue.priority = $("input[name=priority]:checked").val();
            console.log(issue.priority);
            this.parent.projects.active_project.issues.push(issue);
            this.parent.projects.save();

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
            this.activeProjectIssues = this.parent.projects.active_project.issues;

            for (var  i = 0; i < this.activeProjectIssues.length; i++)
            {
                if (this.activeProjectIssues[i].client_id == this.clientIssueId) {
                    this.parent.projects.active_project.issues.splice(i, 1);
                }
            }

            this.parent.projects.save();
        }

        toggleDone(e)
        {
            this.clientIssueId = e.item.client_id;
            this.activeProjectIssues = this.parent.projects.active_project.issues;

            for (var  i = 0; i < this.activeProjectIssues.length; i++)
            {
                if (this.activeProjectIssues[i].client_id == this.clientIssueId) {
                    this.activeProjectIssues[i].done = !this.activeProjectIssues[i].done;
                }
            }

            this.parent.projects.save();
        }

    </script>
</issues>

