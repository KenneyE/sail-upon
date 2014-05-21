window.App.Collections.UserInterests = Backbone.Collection.extend ({
    initialize: function (options) {
        this.user_id = options.user_id;
    },
    
    model: App.Models.Interest,
    
    url: function () {
        return "api/users/" + this.user_id + "/interests";
    },
    
});