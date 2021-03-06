window.App.Views.UserShow = Backbone.CompositeView.extend ({
    template: JST["users/show"],

    initialize: function () {
        var view = this;
        this.listenTo(this.model, "sync", this.render);
        this.listenTo(this.model.interests(), "sync", this.addInterest);
        // this.listenTo(this.model.interests(), "remove", this.render);
        // this.listenTo(this.model.interests(), "add", this.render);
        // 
        this.model.interests().each (function (interest) {
            view.addInterest(interest);
        });
        this.render();        
    },
    
    addInterest: function (interest) {
        var interestShowView = new App.Views.InterestShow({ model: interest }
        );
        this.addSubview(".interests", interestShowView);
        interestShowView.render();
    },
    
    events: {
        "click .profile-btn": "expandProfile",
        "click .about-btn": "expandAbout",
        "click .sail-btn": "sail",
    },
    
    expandProfile: function (event) {
        var view = this;
        var $about = $( ".about-row" );
        var $div = $( ".profile-row" );
        if ( !$about.is (":hidden") ) {
           $about.slideUp("fast", view.toggleRow($div, 'fast'));            
        } else {
            view.toggleRow($div, 'slow');
        }
    },
    
    expandAbout: function (event) {
        
        var view = this;
        var $profile = $( ".profile-row" );
        var $div = $( ".about-row" );
        if ( !$profile.is (":hidden") ) {
           $profile.slideUp("fast", view.toggleRow($div, 'fast'));            
        } else {
            view.toggleRow($div, 'slow');
        }
    },
    
    toggleRow: function ($div, speed) {
        if ( $div.is (":hidden") ) {
           $div.slideDown(speed);            
        } else {
            $div.slideUp(speed);
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
        this.model.interests().sort();
        var content = this.template({user: this.model});
        this.$el.html(content);
        
        this.$el.find(".vote-count").html(this.model.voteCount);
        this.$el.find(".interest-count").html(this.model.interests().length);
        this.$el.find(".sail-count").html(this.model.sailCount);
        
        this.renderSubviews();
        this.delegateEvents();
        
        var $container = this.$el.find('#user-interests');
        $container.hide();
        
        $container.masonry({
            itemSelector: '.interest-panel',
        });
        $container.imagesLoaded( function () {
            $container.fadeIn('fast');
            $container.masonry({
                itemSelector: '.interest-panel',
                isFitWidth: true
            });
        });
        return this;
    },
    
    sail: function (event) {
        debugger
        $.ajax({
            url: 'api/new_sail',
            type: 'POST',
        })
        App.Models.user.sailCount++;
        Backbone.history.navigate("sail", {trigger: true});
    },
});