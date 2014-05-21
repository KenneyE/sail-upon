window.App.Collections.Interests = Backbone.Collection.extend ({
    initialize: function () {
        this.listenTo(this.collection, "sync", this.render);
    },
    
    model: App.Models.Interest,
    
    url: "api/interests",
    
});