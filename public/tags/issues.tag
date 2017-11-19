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
                <tr each={ issues }>
                    <th><input id="checkBox_issue1" type="checkbox" checked={ done }></th>
                    <td if = { done }> <s> { title } </s> </td>
                    <td if = { !done }> { title } </td>
                    <td if = { done }> <s> { date } </s> </td>
                    <td if = { !done }> { date } </td>
                    <td><button onclick={ print }><i class="fa fa-trash"></i></button></td>
                </tr>
            </tbody>
        </table>
    </div>

    <script>

        print() {
            console.log('print');
        }

        this.issues = opts.project.issues;

        delete_issue(e) {
            var issue = e.item;
            var index = this.project.issues.indexOf(issue);
            this.issues.splice(index, 1);
        }

    </script>
</issues>

