<current-projects>
    <div class="container" id="current-projects">
        <h2> Projects </h2>
        <div class="row">
            <div class="col-md-4">
                <ul class="list-group project m-1">
                    <li each={ items } class="list-group-item list-group-item-action justify-content-between">
                    { title }
                    <span class="badge badge-default badge-pill">{ issues.length }</span>
                    </li>
                </ul>
            </div>

            <div class="col-md-8">
                <form class="form-inline m-1" onsubmit={add}>

                    <label class="sr-only" for="inlineFormInput">Create project</label>
                    <input type="text" class="form-control" id="inlineFormInput" placeholder="new project..." onkeyup={edit} ref="input">

                    <button type="submit" class="btn btn-primary">{ create_project }</button>
                </form>

            </div>
        </div>
    </div>

    <new-issue></new-issue>
    <current-issues></current-issues>

    <script>


    this.create_project = "Create Project";

    this.items = opts.items;

    edit(e){
    this.pro_text = e.target.value
    }

    add(e){
        e.preventDefault();

        if(this.pro_text){
            var project = new Project(this.pro_text);
            console.log(project);
            localStorage.setItem(this.pro_text, JSON.stringify(project));

            //Todo: Post the project to the backend


            this.items.push(project);

            console.log(this);
            this.pro_text = this.refs.input.value = '';
        }
    }

    </script>

</current-projects>