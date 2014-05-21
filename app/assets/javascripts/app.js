window.App = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
      new window.App.Routers.AppRouter({$rootEl: $("#content")});
      Backbone.history.start();
  }
};

$(document).ready(function(){
  App.initialize();
});
