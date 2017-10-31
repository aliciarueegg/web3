<current-issues>
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
                    <td><i class="fa fa-trash"></i></td>
                </tr>
            </tbody>
        </table>
    </div>

    <script>
        this.issues = [
            { title: 'Read current documentary', date: "05.10.2017",  done: true },
            { title: 'Drink a beer', date: "06.10.2017"},
            { title: 'Meet friends', date: '07.10.2017', done: true },
            { title: 'Test', date: '08.10.2017' }]
    </script>
</current-issues>

