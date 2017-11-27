<projects>
    <div class="container" id="current-projects">

        <h2> Projects </h2>

        <div class="row">
            <div class="col-md-4">
                <ul class="list-group project m-1">
                    <li each={ projects.collection } class="{ active : (active) } list-group-item list-group-item-action justify-content-between" onclick={ changeActiveProject }>
                    { title }
    <button class="pull-right" onclick = { delete_project }><i class="fa fa-trash"></i></button></li>
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
            this.projects.setActiveProject(e.item.client_id);
        }

        add_project(e)
        {
            e.preventDefault();
            var postProject = new Project(this.new_project_name);
            delete postProject.issues;
            var thisProjects = this.projects;
            $.ajax({
                url: baseURL + "projects",
                method: "POST",
                data: JSON.stringify(postProject),
                dataType:"JSON",
                contentType:"application/json",
                success: function(data) {
                    var project = data;
                    thisProjects.addProject(project);
                    riot.update();
                },
                complete: function() {
                    console.log('completed');
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log('status: ' + xhr.status);
                    console.log('ERROR: ' + thrownError);
                }
            });
            this.new_project_name = this.refs.input.value = '';
        }

    delete_project(e)
    {
    e.preventDefault();

    var deletionID = e.item.client_id;
    console.log(deletionID);
    var p_length = this.projects.collection.length;
    var j;
    for(var i = 0; i < p_length; i++){

        var project = this.projects.collection[i];

        if(project.client_id == deletionID){
        j = i;

        i_length = project.issues.length;
        
        for(var k = 0; k < i_length; k ++){
            debugger;
            $.ajax({
            url: baseURL + "projects/" + project.id + "/issues/" + project.issues[k].id,
            method: "DELETE",
            dataType:"JSON",
            complete: function() {
            console.log('Ajax call completed ISSUE DELETE');
            },
            success: function() {
                console.log(k);
                if (k == i_length) {
                $.ajax({
                url: baseURL + "projects/" + project.id,
                method: "DELETE",
                dataType:"JSON",
                complete: function() {
                console.log('Ajax call completed DELETE');
                },
                error: function(xhr, ajaxOptions, thrownError) {
                console.log('status: ' + xhr.status);
                console.log('ERROR: ' + thrownError);
                }
                });
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
            console.log('status: ' + xhr.status);
            console.log('ERROR: ' + thrownError);
            }
            });
        }
        riot.update();


        }
    }
    if(j){
        this.projects.collection.splice(j,1);
    }

    this.projects.save();

    }
    </script>
</projects>