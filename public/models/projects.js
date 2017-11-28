class Projects {
    constructor() {
        this.collection = [];
        this.local_storage_key = 'projects';
        this.active_project = null;
        this.fetch();
        this.setActiveProject();
    }

    save() {
        //this.synchronizeCollectionWithActiveProject();
        localStorage.setItem(this.local_storage_key, JSON.stringify(this.collection));

    }




    synchronizeCollectionWithActiveProject()
    {
        for (var i = 0; i < this.collection.length; i++)
        {
            if (this.collection[i].uuid == this.active_project.uuid)
            {
                this.collection[i] = this.active_project;
            }
        }
    }

    fetch()
    {
        this.collection = JSON.parse(localStorage.getItem(this.local_storage_key)) || [];
    }


    setActiveProject(client_project_id)
    {
        if (client_project_id == undefined)
        {
            for(var i = 0; i < this.collection.length; i++){
                if(this.collection[i].active){
                    this.active_project = this.collection[i];
                }
            }
        }
        else
        {
            if (this.collection.length != 0) {

                for (var i = 0; i < this.collection.length; i++)
                {
                    var project = this.collection[i];

                    if (project.client_id == client_project_id)
                    {
                        project.active = true;

                        this.active_project = project;
                    }
                    else
                    {
                        project.active = false;
                    }
                }
            }
            else
            {
                console.log("no project in projects");
            }
        }
        this.save();

    }

    addProject(project)
    {
        if (project) {

            project.issues = [];

            this.collection.push(project);

            this.setActiveProject(project.client_id);

            this.save();
        }
    }
}