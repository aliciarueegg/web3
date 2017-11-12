<current-projects>
    <div class="container" id="current-projects">
        <h2> Projects </h2>
        <div class="row">
            <div class="col-md-4">
                <ul class="list-group project m-1">
                    <li class="list-group-item list-group-item-action justify-content-between">
                    ZHAW - Web3
                    <span class="badge badge-default badge-pill">14</span>
                    </li>
                    <li class="list-group-item list-group-item-action justify-content-between">
                    ZHAW - KT
                    <span class="badge badge-default badge-pill">2</span>
                    </li>
                    <li class="list-group-item list-group-item-action justify-content-between">
                    Arbeit - ProjectX
                    <span class="badge badge-default badge-pill">1</span>
                    </li>
                </ul>
            </div>

            <div class="col-md-8">
                <form class="form-inline m-1">

                    <label class="sr-only" for="inlineFormInput">Create project</label>
                    <input type="text" class="form-control" id="inlineFormInput" placeholder="new project...">

                    <button type="submit" class="btn btn-primary">{ create_project }</button>
                </form>

            </div>
        </div>
    </div>

    <new-issue></new-issue>
    <current-issues></current-issues>

    <script>
        this.create_project = "Create Project";
    </script>

</current-projects>