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
        "click .sign-out": "signOut",
    },
    
    sail: function (event) {
        Backbone.history.navigate("sail", {trigger: true});
    },
    
    signOut: function (event) {
       $.ajax ({
           url: 'session/',
           type: "DELETE",
       });
       debugger
       App.Models.user = undefined;
       Backbone.history.navigate("#", {trigger: true});  
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