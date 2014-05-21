App.Routers.AppRouter = Backbone.Router.extend({
    initialize: function (options) {
        this.$rootEl = options.$rootEl;
    },
    
    routes: {
        "": "userShow",
        "interests/:id": "interestShow",
    },
    
    userShow: function (id) {
        var user = new App.Models.User();
        user.fetch();
        
        var view = new App.Views.UserShow({ model: user });
        this.$rootEl.html(view.render().$el);
    },
    
    interestShow: function (id) {
        var interest = new App.Models.Interest({id: id});
        interest.fetch();
        
        var view = new App.Views.InterestShow({model: interest});
        this.$rootEl.html(view.render().$el);
    },
    
});
