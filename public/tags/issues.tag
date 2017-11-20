<issues>
    <new-issue></new-issue>

    <div class="container" id="current-issues">
    <h2> Issues </h2>

    <table class="table">
        <thead>
            <tr>
                <th></th>
                <th>Issue</th>
                <th>Created date</th>
                <th>Edit</th>
            </tr>
        </thead>

        <tbody>
            <tr each={ issuesOfProject }>
            <th><input id="checkBox_issue1" type="checkbox" checked={ done }></th>
            <td if = { done }> <s> { title } </s> </td>
            <td if = { !done }> { title } </td>
            <td if = { done }> <s> { created_at } </s> </td>
            <td if = { !done }> { created_at } </td>
            <td><button><i class="fa fa-trash"></i></button></td>
            </tr>
        </tbody>
    </table>
    </div>

    <script>
        this.on('before-mount', function() {
            this.project = JSON.parse(localStorage.getItem('projects'));
            if (this.project != null)
            {
                this.issuesOfProject = project[0].issues;
            }
            else
            {
                this.issuesOfProject = null;
            }
        });
    </script>

</issues>

