  var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),

  showLeftPush = document.getElementById( 'showLeftPush' ),
  body = document.body;


  classie.add( showLeftPush, 'active' );
  classie.add( body, 'cbp-spmenu-push-toright' );
  classie.add( menuLeft, 'cbp-spmenu-open' );

  showLeftPush.onclick = function() {
    classie.toggle( this, 'active' );
    classie.toggle( body, 'cbp-spmenu-push-toright' );
    classie.toggle( menuLeft, 'cbp-spmenu-open' );
  };
  
