<new-issue>
    <div class="container" id="new-issues">
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

    <script>

        this.project = opts.project;

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

                riot.update()
            }
        }


    </script>

</new-issue>