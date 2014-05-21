App.Routers.AppRouter = Backbone.Router.extend({
    initialize: function (options) {
        this.$rootEl = options.$rootEl;
    },
    
    routes: {
        
        "users/:id": "userShow",
        "users/:user_id/interests": "interestsIndex",
        "interests/:id": "interestShow", 
    },
    
    interestsIndex: function (user_id) {
        var interests = new App.Collections.UserInterests({ user_id: user_id });
        interests.fetch();
        
        var view = new App.Views.InterestsIndex({ collection: interests });
        this.$rootEl.html(view.render().$el);
    },

    interestShow: function (id) {
        var interest = new App.Models.Interest({id: id});
        interest.fetch();
        
        var view = new App.Views.InterestShow({model: interest});
        this.$rootEl.html(view.render().$el);
    },
    
    userShow: function (id) {
        var user = new App.Models.User({id: id});
        user.fetch();
        
        var view = new App.Views.UserShow({ model: user });
        this.$rootEl.html(view.render().$el);
    },
});
