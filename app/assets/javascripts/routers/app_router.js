App.Routers.AppRouter = Backbone.Router.extend({
    initialize: function (options) {
        this.$rootEl = options.$rootEl
    },
    
    routes: {
        "users/:id": "userShow",
        
    },
    
    userShow: function (id) {
        var user = new App.Models.User({id: id});
        user.fetch();
        
        var view = new App.Views.UserShow({ model: user });
        this.$rootEl.html(view.render().$el);
    }
});
