// Add toggle listeners to listen for clicks.
document.addEventListener("turbo:load", function() { 

    let hamburger = document.querySelector("#hamburger");
    hamburger.addEventListener("click", function(event) {
      event.preventDefault();
      let menu = document.querySelector("#navbar-menu");
      menu.classList.toggle("collapse");
    });
    
    let account = document.querySelector("#account"); 
    account.addEventListener("click", function(event) { 
      event.preventDefault(); 
      let menu = document.querySelector("#dropdown-menu"); 
      menu.classList.toggle("active"); 
    });
});

// document.addEventListener("turbo:load", function() { 

//     function addToggleListener(selected_id, menu_id, toggle_class) { 
//         let selected_element = document.querySelector(`#${selected_id}`);
    
//             selected_element.addEventListener("click", function(event) { 
//                 event.preventDefault(); 
//                 let menu = document.querySelector(`#${menu_id}`) 
//                 menu.classList.toggle(toggle_class); 
//             });
//         } 
        
//         document.addEventListener("turbo:load", function() { 
//             addToggleListener("hamburger", "navbar-menu", "collapse"); 
//             addToggleListener("account", "dropdown-menu", "active");
//         })
//     });