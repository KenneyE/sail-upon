window.App.Views.Navbar = Backbone.View.extend ({
    template: JST["shared/navbar"],
    
    render: function () {
        var content = this.template({current_user: App.Models.user });
        this.$el.html(content);
        
        this.flash("Welcome, " + App.Models.user.get('username'));
        return this;
    },
    
    events: {
        "click .sail-btn": "sail",
        "click .thumbs-down": "downvote",
        "click .thumbs-up": "upvote",
        "click .sign-out": "signOut",
    },
    
    flash: function (text) {
        this.$el.find(".flash-text").html(text);
        this.$el.find(".navbar-flash").fadeIn('fast').delay(2500).fadeOut(800);
    },
    
    downvote: function (event) {
        if (Backbone.history.fragment.indexOf("sail") === -1 ) {
            flashes = ["Are you not entertained?!", "If you hit it one more time, it might work.", "Gotta hit that Sail button first.", "Did you want a Cat category? Is that it?", "Boooooo!!!!", "Fine. Here's some <a href='http://www.feminiya.com/wp-content/uploads/2013/05/Dog-GIFs-of-All-Time-27.gif' target='_blank'> cats</a>", "Thought you could vote on yourself?", "What could you possibly dislike about this?", "Quit complaining and hit that Sail button.", "Statler and Waldorf over here." ];
            flashText = flashes[Math.floor(Math.random() * flashes.length)];
            this.flash(flashText);
            
        } else {
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
        }
    },
    
    upvote: function (event) {
        if (Backbone.history.fragment.indexOf("sail") === -1 ) {
            flashes = ["Nice, I like you too.", "Are you upvoting yourself right now?", "I'll take that as a compliment.", "If you like this, try actually using the site!", "That's pretty neat!", "Buck, is that you thumbs upping?", "I know.", "Take it easy buddy. This isn't Facebook. Gotta Sail first.", "Got a regular Siskel and Ebert over here."];
            flashText = flashes[Math.floor(Math.random() * flashes.length)];
            this.flash(flashText);
        } else {
            var view = this;
            var id = event.currentTarget.dataset.id;
        
            $.ajax({
                url: "api/websites/" + id + "/vote/1",
                dataType: 'json',
                type: 'POST',
                success: function (resp) {
                    $('.thumbs-down').removeClass('voted');
                    $(event.currentTarget).addClass('voted');        
                    view.updateVoteCount(resp);
                }
            });
        }
    },
    
    updateVoteCount: function (resp) {
        if (resp.status === "new") {
            App.Models.user.voteCount++;
        }
    },
    
    sail: function (event) {
        $.ajax({
            url: 'api/new_sail',
            type: 'POST',
        });
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
    

});