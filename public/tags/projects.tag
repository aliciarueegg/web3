<projects>
    <div class="container" id="current-projects">

        <h2> Projects </h2>

        <div class="row">
            <div class="col-md-4">
                <ul class="list-group project m-1">
                    <li each={ projects.collection } class="{ active : (active) } list-group-item list-group-item-action justify-content-between" onclick={ changeActiveProject }>
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

    <issues active_project = { projects.active_project }></issues>

    <script>

        this.on('before-mount', function() {
            this.projects = new Projects();
        })

        edit(e)
        {
            this.new_project_name = e.target.value;
        }

        changeActiveProject(e)
        {
            this.projects.setActiveProject(e.item.client_project_id);
        }

        add_project(e)
        {
            e.preventDefault();

            this.projects.addProject(this.new_project_name);

            this.new_project_name = this.refs.input.value = '';
        }
    </script>
</projects>