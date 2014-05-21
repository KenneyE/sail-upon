App.Routers.AppRouter = Backbone.Router.extend({
    initialize: function (options) {
        this.$rootEl = options.$rootEl
    },
    
    routes: {
        "": "userShow",
        
    },
    
    userShow: function () {
        
    }
});
