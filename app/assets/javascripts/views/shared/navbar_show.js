window.App.Views.Navbar = Backbone.View.extend ({
    template: JST["shared/navbar"],
    
    render: function () {
        var content = this.template({current_user: App.Models.user });
        this.$el.html(content);
        return this;
    },
    
    events: {
        "click .sail-btn": "sail",
        "click .thumbs-down": "downvote",
        "click .thumbs-up": "upvote",
    },
    
    sail: function (event) {
        Backbone.history.navigate("sail", {trigger: true})
    },
    
    downvote: function (event) {
        var id = event.currentTarget.dataset.id;
        $.ajax({
            url: "api/websites/" + id + "/vote/0",
            dataType: 'json',
            type: 'POST',
        });
    },
    
    upvote: function (event) {
        var id = event.currentTarget.dataset.id;
        $.ajax({
            url: "api/websites/" + id + "/vote/1",
            dataType: 'json',
            type: 'POST',
        });
    },
});