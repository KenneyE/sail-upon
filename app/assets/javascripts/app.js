window.App = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
      
      var bootstrapped_json =
      JSON.parse($("#current_user_json").html());

      App.Models.user = new App.Models.User();
      App.Models.user.set(bootstrapped_json.current_user);
      
      App.Models.user.fetch();
      App.Models.user.interests().set(bootstrapped_json.current_user.interests);
      
      App.Collections.interests = new App.Collections.Interests();
      App.Collections.interests.set(bootstrapped_json.interests);
      
      var navbar = new App.Views.Navbar();
      $("#navbar").html(navbar.render().$el);
      
      App.Collections.websites = new App.Collections.Websites();
      new window.App.Routers.AppRouter({$rootEl: $("#content")});
      Backbone.history.start();
  }
};

$(document).ready(function(){
  App.initialize();
});

Backbone.CompositeView = Backbone.View.extend({
    addSubview: function (selector, subview) {
        var selectorSubviews = 
        this.subviews()[selector] || (this.subviews()[selector] = []);
        
        selectorSubviews.push(subview);
        var $selectorEl = this.$(selector);
        $selectorEl.append(subview.$el);
    },
    
    renderSubviews: function () {
        var view = this;
        _(this.subviews()).each (function (selectorSubviews, selector) {
            var $selectorEl = view.$(selector).empty();
            _(selectorSubviews).each (function (subview) {
                $selectorEl.append(subview.render().$el);
                subview.delegateEvents();
            });
        });
    },
    
    remove: function () {
       Backbone.View.remove.prototype.call(this);
       _(this.subviews).each ( function (selectorSubviews, selector) {
           _(selectorSubview).each (function (subview) {
               subview.remove();
           });
       }) ;
    },
    
    removeSubview: function (selector, subview) {
        var selectorSubviews = 
        this.subviews()[selector] || (this.subviews()[selector] = []);
        
        var subviewIndex = selectorSubviews.indexOf(subview);
        selectorSubviews.splice(subviewIndex, 1);
        subview.remove();
    },
    
   subviews: function () {
       if (!this._subviews) {
           this._subviews = {};
       }
       return this._subviews;
   },
});