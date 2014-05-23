window.App.Collections.Websites = Backbone.Collection.extend ({
    model: App.Models.Website,
    
    getOrFetch: function (id) {
        var websites = this;
 
        var website;
        if (website = this.get(id)) {
            website.fetch();
        } else {
            website = new App.Models.Website({ id: id });
            website.fetch({
                success: function () { websites.add(website); }
            });
        }
        return website;  
    },
});