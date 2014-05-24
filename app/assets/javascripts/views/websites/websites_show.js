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
        debugger
        this.replaceVoteLinks(this.model.id);
        
        return this;
    },
    
    tagName: "iframe",
    
    attributes: {"frameBorder": "0"},
    
    className: "website-iframe col-xs-12",
    
    template: JST["websites/show"],
    
    replaceVoteLinks: function(id) {
        var actionText = "/api/websites/" + id + "/vote/";
        $('.upvote-form').attr('action', actionText + "1" );
        $('.downvote-form').attr('action', actionText + "0" );
    },
    
});