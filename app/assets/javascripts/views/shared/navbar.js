window.App.Views.Navbar = Backbone.View.extend ({
    template: JST["shared/navbar"],
    
    render: function () {
        debugger
        var content = this.template({current_user: this.current_user});
        this.$el.html(content);
        return this;
    },
    
    initialize: function (options) {
        this.current_user = options.current_user;
    },
    
    
});