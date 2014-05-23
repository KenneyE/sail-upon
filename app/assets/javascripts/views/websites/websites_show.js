window.App.Views.WebsiteShow = Backbone.View.extend ({
    initialize: function () {
        this.listenTo(this.model, "sync", this.render);
    },
    
    render: function () {
        if (this.model.get('url') ) {
            this.el.src = this.model.get('url');
        }
        var content = this.template({website: this.model});
        
        this.$el.html(content);
        return this;
    },
    
    tagName: "iframe",
    
    attributes: {"frameBorder": "0"},
    
    className: "website-iframe col-xs-12",
    
    template: JST["websites/show"],
    
});