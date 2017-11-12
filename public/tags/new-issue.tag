<new-issue>
    <div class="container" id="new-issues">
        <h2> New Issue </h2>

        <div class="row">
            <div class="col-md-4">
                <input type="date" name="date" id="date">
            </div>

            <div class="col-md-8">
                <form class="form-inline m-1" onsubmit={add}>

                    <label class="sr-only" for="inlineFormInput">Name</label>
                    <input type="text" class="form-control" id="inlineFormInput" placeholder="new issue...">

                    <button type="button" class="btn btn-primary">{ issue_button }</button>
                </form>
            </div>
        </div>
    </div>
    <script>
        this.issue_button = "Create issue";

    add(e){
    e.preventDefault();
    if(this.text){
    var issue = new Issue (this.text);
    //Todo: Post the issue to the backend

    this.items.push(issue);
    this.text = this.refs.input.value = '';
    }
    }
    </script>

</new-issue>