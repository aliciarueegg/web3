<new-issue>
    <div class="container" id="new-issues">
        <h2> New Issue </h2>

        <div class="row">
            <div class="col-md-4">
                <input type="date" name="date" id="date">
            </div>

            <div class="col-md-8">
                <form class="form-inline m-1" id="issueForm">

                    <label class="sr-only" for="newIssueName">Name</label>
                    <input type="text" class="form-control" id="newIssueName" name="name" placeholder="new issue...">

                    <button type="button" class="btn btn-primary" id="save_issue" onclick={ submit } >{ issue_button }</button>
                </form>
            </div>
        </div>
    </div>

    <script>

        this.issue_button = "Create issue";

        var tag = this;

        tag.submit = function()
        {

             console.log(tag.name);
        }


    </script>

</new-issue>