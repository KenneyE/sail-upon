window.App.Views.InterestShow = Backbone.View.extend ({

    // className: "col-xs-2",
    className: "panel panel-default interest-panel",

    initialize: function (options) {
        this.current_user = App.Models.user;
        this.listenTo(this.model, "sync", this.render);
        this.render();
    },

    isInterested: function () {
        var view = this;
        var interests =  this.current_user.interests();
        return interested = (_.find(interests.models, function (interest) {
            return interest.id === view.model.id;
        }));
    },
    
    events: {
        "click .follow-btn": "toggleFollow", 
    },

    render: function () {
        var content = this.template({ interest: this.model, 
            interested: this.isInterested()});
            var img_name = this.model.get("name").replace(" ", "_");
            var src = "interests/" +  img_name + ".jpg";
            this.$el.data(String(this.model.id));
            this.$el.html(content);
            this.$el.find(".interest-panel-image > img").attr("src", src);
            return this;
        },

        template: JST["interests/show"],

        toggleFollow: function (event) {
            var view = this;
            if (view.isInterested()) {
                view.model.unfollow();
                view.current_user.interests().remove(view.model);
            } else {
                view.model.follow();
                view.current_user.interests().add(view.model); 
            }            
            $(event.currentTarget.parentElement).find(".follow-btn").toggleClass("hidden");
        },
    });