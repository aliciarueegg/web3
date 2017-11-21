<issues>
    <div if={ opts.active_project } class="container" id="new-issues">
        <h2> New Issue </h2>

        <div class="row">
            <div class="col-md-4">
                <input type="date" name="date" id="date">
            </div>

            <div class="col-md-8">
                <form class="form-inline m-1" id="issueForm" onsubmit={ add_issue }>

                    <label class="sr-only" for="newIssueName">Name</label>
                    <input type="text" class="form-control" id="newIssueName" name="name" placeholder="new issue..." onkeyup={ edit } ref="input">

                    <button type="submit" class="btn btn-primary" id="save_issue" >Create issue</button>
                </form>
            </div>
        </div>
    </div>

    <div if={ opts.active_project } class="container" id="current-issues">
        <h2> Issues </h2>

        <table class="table">
            <thead>
                <tr>
                    <th></th>
                    <th>Issue</th>
                    <th>Created date</th>
                    <th>Edit</th>
                </tr>
            </thead>

            <tbody>
                <tr each={ issuesOfProject }>
                    <th><input id="checkBox_issue1" type="checkbox" checked={ done } onclick = { toggleDone } ></th>
                    <td if = { done }> <s> { title } </s> </td>
                    <td if = { !done }> { title } </td>
                    <td if = { done }> <s> { created_at } </s> </td>
                    <td if = { !done }> { created_at } </td>
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

        add_issue(e)
        {
            e.preventDefault();

            this.parent.projects.active_project.issues.push(new Issue(this.new_issue_name));
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
            this.clientIssueId = e.item.client_issue_id;
            this.activeProjectIssues = this.parent.projects.active_project.issues;

            for (var  i = 0; i < this.activeProjectIssues.length; i++)
            {
                if (this.activeProjectIssues[i].client_issue_id == this.clientIssueId) {
                    this.parent.projects.active_project.issues.splice(i, 1);
                }
            }

            this.parent.projects.save();
        }

        toggleDone(e)
        {
            this.clientIssueId = e.item.client_issue_id;
            this.activeProjectIssues = this.parent.projects.active_project.issues;

            for (var  i = 0; i < this.activeProjectIssues.length; i++)
            {
                if (this.activeProjectIssues[i].client_issue_id == this.clientIssueId) {
                    this.activeProjectIssues[i].done = !this.activeProjectIssues[i].done;
                }
            }

            this.parent.projects.save();
        }

    </script>
</issues>

