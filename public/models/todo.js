class Todo {
    constructor() {
        this.collection = [];
        this.localStorage_key = "todos";
        this.fetch();
    }

    fetch() {
        this.collection = JSON.parse(localStorage.getItem(this.localStorage_key)) || [];
    }

    save() {
        localStorage.setItem(this.localStorage_key, JSON.stringify(this.collection));
    }
}