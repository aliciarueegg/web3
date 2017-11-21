<projects>
    <div class="container" id="current-projects">

        <h2> Projects </h2>

        <div class="row">
            <div class="col-md-4">
                <ul class="list-group project m-1">
                    <li each={ projects } class={ active : (title === active_project_name) } class="list-group-item list-group-item-action justify-content-between" onclick={ changeActiveProject }>
                    { title }
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

    <issues active_project={ active_project }></issues>

    <script>

        this.projects = new Projects();

        this.projects = null;

        this.new_project_name = '';

        this.active_project_name = null;

        changeActiveProject(e)
        {
            this.active_project_name = e.item.title;
            this.active_project = e.item;

            this.update();
        }

        edit(e)
        {
            this.new_project_name = e.target.value;
        }

        add_project(e)
        {
            e.preventDefault();

            if (this.new_project_name) {
                var project = new Project();
                project.title = this.new_project_name;
                this.active_project_name = this.new_project_name;
                this.active_project = this.project;

                this.projects.push(project);
                localStorage.setItem('projects', JSON.stringify(this.projects));

                this.new_project_name = this.refs.input.value = '';
            }

            this.update();
        }

        this.on('before-mount', function() {

    }
            if (localStorage.getItem('projects') && localStorage.getItem('projects') != []) {
                this.projects = JSON.parse(localStorage.getItem('projects'));
                this.active_project_name = this.projects[0].title;
                this.active_project = this.projects[0];
            } else {
                console.log('localstorage empty');
                this.projects = [];
            }
        });

    </script>
</projects>