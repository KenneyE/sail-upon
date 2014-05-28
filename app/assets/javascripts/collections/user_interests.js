window.App.Collections.UserInterests = Backbone.Collection.extend ({
    initialize: function (attrs, options) {
        this.set(attrs);
        this.user = options.user;
    },
    
    comparator: 'name',
    
    model: App.Models.Interest,
    
    url: function () {
        return "api/users/" + this.user.id + "/interests";
    },
});