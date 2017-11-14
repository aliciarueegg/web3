<current-projects>
    <div class="container" id="current-projects">
        <h2> Projects </h2>
        <div class="row">
            <div class="col-md-4">
                <ul class="list-group project m-1">
                    <li each={ projects } class="list-group-item list-group-item-action justify-content-between">
                    { title }
                    <span class="badge badge-default badge-pill">0</span>
                    </li>
                </ul>
            </div>

            <div class="col-md-8">
                <form class="form-inline m-1" onsubmit={add_project}>

                    <label class="sr-only" for="inlineFormInput">Create project</label>
                    <input type="text" class="form-control" id="inlineFormInput" placeholder="new project..." onkeyup={edit} ref="input">

                    <button type="submit" class="btn btn-primary">{ create_project }</button>
                </form>

            </div>
        </div>
    </div>

    <current-issues project={projects[0]}></current-issues>

    <script>

    this.create_project = "Create Project";

    this.projects = opts.projects;
    //var projects = new Array();


    edit(e){
        this.project_name = e.target.value;
    }


    add_project(e){
        e.preventDefault();

        if(this.project_name){
            var project = new Project();
            project.title = this.project_name;
            //Todo: Post the project to the backend

            this.projects.push(project);

            // clear input field
            this.project_name = this.refs.input.value = '';
            //this.update();
            localStorage.setItem('projects', JSON.stringify(this.projects));

    }
    }

    this.on('before-mount', function() {
    // right after the tag is mounted on the page
    //console.log(localStorage);
    if (localStorage.getItem('projects')) {
    this.projects = JSON.parse(localStorage.getItem('projects'));
    } else {
    console.log('ls empty');
    }
    })

    </script>

</current-projects>