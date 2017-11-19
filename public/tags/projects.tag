<projects>
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
                <form class="form-inline m-1" onsubmit={ add_project }>
                    <label class="sr-only" for="inlineFormInput">Create project</label>
                    <input type="text" class="form-control" id="inlineFormInput" placeholder="new project..." onkeyup={edit} ref="input">
                    <button type="submit" class="btn btn-primary">Create Project</button>
                </form>
            </div>
        </div>

    </div>

    <issues project={ active_project }></issues>



    <script>

        this.projects = opts.projects;

        this.active_project = this.projects[0];

        this.new_project_name = '';

        edit(e) {
            this.new_project_name = e.target.value;
        }

        add_project(e) {
            e.preventDefault();

            if (this.new_project_name) {
                var project = new Project();
                project.title = this.new_project_name;
                this.projects.push(project);
                save_to_localstorage();

                this.new_project_name = this.refs.input.value = '';
            }
        }

        save_to_localstorage() {
            localStorage.setItem('projects', JSON.stringify(this.projects));
        }

        this.on('before-mount', function() {
            if (localStorage.getItem('projects')) {
                this.projects = JSON.parse(localStorage.getItem('projects'));
            } else {
                console.log('localstorage empty');
            }
        })

    </script>

</projects>