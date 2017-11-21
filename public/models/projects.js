class projects {
    construction()
    {
        this.collection = [];
        this.local_storage_key = 'projects';
    }

    save()
    {
        localStorage.setItem(this.local_storage_key, JSON.stringify(this.collection));
    }

    fetch()
    {
        this.collection = JSON.parse(localStorage.getItem(this.localStorage_key)) || [];
    }
}