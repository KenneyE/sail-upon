window.App.Views.WebsiteShow = Backbone.View.extend ({
    initialize: function () {
        this.fetchSite();
        this.listenTo(this.model, "change", this.render);
    },
    
    render: function () {
        if (this.model.get('url') ) {
            this.el.src = this.model.get('url');
        }
        var content = this.template({website: this.model});
        this.$el.html(content);
        return this;
    },
    
    events: {
        "click .sail": "fetchSite",
    },
    
    fetchSite: function () {
        var site = new App.Models.Website();
        site.fetch();
        this.model = site;
    },
    
    tagName: "iframe",
    
    attributes: {"frameBorder": "0"},
    
    className: "website-iframe col-xs-12",
    
    template: JST["websites/show"],
    
});