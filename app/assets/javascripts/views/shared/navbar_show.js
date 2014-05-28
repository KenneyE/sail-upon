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
        $.ajax({
            url: 'api/new_sail',
            type: 'POST',
        })
        App.Models.user.sailCount++;
        Backbone.history.navigate("sail", {trigger: true});
    },
    
    signOut: function (event) {
       $.ajax ({
           url: 'session/',
           type: "DELETE",
       });
       App.Models.user = undefined;
       window.location.href = "/session/new";
    },
    
    downvote: function (event) {
        var view = this;
        var id = event.currentTarget.dataset.id;

        $.ajax({
            url: "api/websites/" + id + "/vote/0",
            dataType: 'json',
            type: 'POST',
            success: function (resp) {
                $('.thumbs-up').removeClass('voted');
                $(event.currentTarget).addClass('voted');
                view.updateVoteCount(resp);
            }
        });
    },
    
    upvote: function (event) {
        var view = this;
        var id = event.currentTarget.dataset.id;
        
        $.ajax({
            url: "api/websites/" + id + "/vote/1",
            dataType: 'json',
            type: 'POST',
            success: function (resp) {
                $('.thumbs-down').removeClass('voted');
                $(event.currentTarget).addClass('voted')        
                view.updateVoteCount(resp);
            }
        });
    },
    
    updateVoteCount: function (resp) {
        if (resp.status === "new") {
            App.Models.user.voteCount++;
        }
    },
});