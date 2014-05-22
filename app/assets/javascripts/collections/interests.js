window.App.Collections.Interests = Backbone.Collection.extend ({

    model: App.Models.Interest,
    
    url: "api/interests",
});