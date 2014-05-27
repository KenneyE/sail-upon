App.Routers.AppRouter = Backbone.Router.extend({
    initialize: function (options) {
        this.$rootEl = options.$rootEl;
    },
    
    routes: {
        "": "userShow",
        "users/:id": "userShow",
        "interests": "interestsIndex",
        "interests/:id": "interestShow", 
        "sail": "websitePick",
        "sail/:id": "websiteShow",
    },
    
    interestsIndex: function () {        
        var interests = App.Collections.interests;
        
        var view = new App.Views.InterestsIndex({ collection: interests });
        this.$rootEl.html(view.render().$el);
    },

    interestShow: function (id) {
        var interest = new App.Models.Interest({id: id});
        interest.fetch();
        var view = new App.Views.InterestShow({ model: interest });
        this.$rootEl.html(view.render().$el);
    },
    
    userShow: function (id) {
        var view = new App.Views.UserShow({ model: App.Models.user });
        this.$rootEl.html(view.render().$el);
    },
    
    websitePick: function () {
        var that = this;
        var site = new App.Models.Website();
        site.fetch({
            success: function () {
                App.Collections.websites.add(site);
                Backbone.history.navigate("sail/" + site.get('id'), 
                                            {trigger: true}
                                         );
            }
        });        
    },
    
    websiteShow: function (id) {
        var site = App.Collections.websites.getOrFetch(id);
        var view = new App.Views.WebsiteShow({model: site});
        this.$rootEl.html(view.render().$el);
    },
});
