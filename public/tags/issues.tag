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

    this.new_issue_name = "";

        edit(e)
        {
            this.new_issue_name = e.target.value;
        }

        add_issue(e)
        {
            e.preventDefault();

            if (this.new_issue_name) {

                var issue = new Issue();

                issue.title = this.new_issue_name;
                this.new_issue_name = this.refs.input.value = '';


                this.project.issues.push(issue);
                this.issuesOfProject = this.project.issues;
            }

            this.projectsOfLocalstorage = JSON.parse(localStorage.getItem('projects'));

            for (var  i = 0; i < this.projectsOfLocalstorage.length; i++)
            {
                this.projectsOfLocalstorage[i].issues.push(issue);
            }

            localStorage.setItem('projects', JSON.stringify(this.projectsOfLocalstorage));

            this.update();
        }

        this.on('update', function() {
            this.project = opts.active_project;
            if (this.project != undefined)
            {
                this.issuesOfProject = this.project.issues;
            }
        });

        deleteIssue(e)
        {
            var indexOfItem;

            for (var i = 0; i < this.project.issues.length; i ++)
            {
                if (this.project.issues[i].title == e.item.title)
                {
                    delete this.project.issues[i];
                }
            }

            this.project.issues = this.project.issues.filter(function(n){ return n != null });

            this.projectsOfLocalstorage = JSON.parse(localStorage.getItem('projects'));

            for (var  i = 0; i < this.projectsOfLocalstorage.length; i++)
            {
                if (this.projectsOfLocalstorage[i].title == this.project.title)
                {
                    this.projectsOfLocalstorage[i].issues = this.project.issues
                }
            }

            localStorage.setItem('projects', JSON.stringify(this.projectsOfLocalstorage));

            this.issuesOfProject = this.project.issues;

            this.update();
        }

        toggleDone(e)
        {
            if (e.item.done == true)
            {
                e.item.done = false;
            }
            else
            {
                e.item.done = true;
            }

            this.projectsOfLocalstorage = JSON.parse(localStorage.getItem('projects'));

            for (var  i = 0; i < this.projectsOfLocalstorage.length; i++)
            {
                if (this.projectsOfLocalstorage[i].title == this.project.title) {
                    this.projectsOfLocalstorage[i].issues = this.project.issues;
                }

            }

            localStorage.setItem('projects', JSON.stringify(this.projectsOfLocalstorage));
            this.update();
        }

    </script>
</issues>

