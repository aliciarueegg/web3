<new-issue>
    <div class="container" id="new-issues">
        <h2> New Issue </h2>

        <div class="row">
            <div class="col-md-4">
                <input type="date" name="date" id="date">
            </div>

            <div class="col-md-8">
                <form class="form-inline m-1" onsubmit={add_issue}>

                    <label class="sr-only" for="inlineFormInput">Name</label>
                    <input type="text" class="form-control" id="inlineFormInput" placeholder="new issue..." onkeyup={edit_issue} ref="input_issue">

                    <button type="button" class="btn btn-primary">{ issue_button }</button>
                </form>
            </div>
        </div>
    </div>
    <script>
        this.issue_button = "Create issue";

    edit_issue(e){
    this.issue_text = e.target.value

    }

    add_issue(e){
    e.preventDefault();
    if(this.issue_text){
    var issue = new Issue(this.pro_text);
    //console.log(issue);
    localStorage.setItem(issue.title, JSON.stringify(issue));



    //Todo: Post the issue to the backend


    this.items.push(issue);

    //console.log(this);
    this.issue_text = this.refs.input.value = '';
    }
    }
    </script>

</new-issue>