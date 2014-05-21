window.App.Views.InterestsIndex = Backbone.View.extend ({
    initialize: function () {
        this.listenTo(this.collection, "sync", this.render);
    },
    
    render: function () {
       var content = this.template({ interests: this.collection });
       this.$el.html(content);
       return this;
    },

    template: JST["interests/index"],
});