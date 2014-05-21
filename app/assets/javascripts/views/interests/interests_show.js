window.App.Views.InterestShow = Backbone.View.extend ({
    initialize: function () {
        this.listenTo(this.model, "sync", this.render);
    },
    
    render: function () {
        var content = this.template({ interest: this.model });
        this.$el.html(content);
        return this;
    },
    
    template: JST["interests/show"],
});