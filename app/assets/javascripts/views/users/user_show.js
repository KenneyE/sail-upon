window.App.Views.UserShow = Backbone.CompositeView.extend ({
    template: JST["users/show"],

    initialize: function () {
        var view = this;
        this.listenTo(this.model, "sync", this.render);
        this.listenTo(this.model.interests(), "sync", this.addInterest);
        this.model.interests().each (function (interest) {
            view.addInterest(interest);
        });
    },
    
    addInterest: function (interest) {
        var interestShowView = new App.Views.InterestShow({ model: interest }
        );
        this.addSubview(".interests", interestShowView);
        interestShowView.render();
    },
    
    events: {
        "click .profile-btn": "expandProfile",
    },
    
    expandProfile: function (event) {
        $div = $( ".profile-row" );
        if ( $div.is (":hidden") ) {
           $div.slideDown("slow");            
        } else {
            $div.slideUp("slow");
        }
    },
    
    removeInterest: function (interest) {
        var interestShowView = 
        _(this.subviews()[".interests"]).find (function (subview) {
            return subview.model == interest;
        });
       
        this.removeSubview(".interests", interestShowView);
    },
    
    render: function () {
        var view = this;
        var content = this.template({user: this.model});
        this.$el.html(content);
        
        this.$el.find(".vote-count").html(App.Models.user.get("votes").length);
        
        this.renderSubviews();
        
        var $container = this.$el.find('#user-interests');
        $container.masonry({
            itemSelector: '.interest-panel',
        });
        $container.imagesLoaded( function () {
            $container.masonry({
                itemSelector: '.interest-panel'
            });
        });
        return this;
    },
});