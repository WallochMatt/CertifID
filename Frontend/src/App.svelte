<script lang="ts">
  import { Appsettings } from '../Appsettings'
  import UsersPage from './lib/pages/UsersPage.svelte';
  import GroupsPage from './lib/pages/GroupsPage.svelte';
  import LocationsPage from './lib/pages/LocationsPage.svelte';
  import AdminSettingsPage from './lib/pages/AdminSettingsPage.svelte';


  if(Appsettings.Built)
  {
    //Logic for when built by the function app
  };

  
  // The selected manager acts as a key select for the pages, ex pages["Users"] instatntiates UsersPage
  let selectedManager = 'Users';
  let showModal = false;
  
  function changeManager(selected){
    console.log("selected is: ", selected)
    selectedManager = selected;
  };
  
  let pages = {
    "Users" : UsersPage,
    "Groups" : GroupsPage,
    "Locations & Access Points" : LocationsPage,
    "Admin Settings" : AdminSettingsPage,
  };


  // Users should have a picture property, defaulted to using their initials?
    let currentUser = {
          "firstName" : "Matthew",
          "lastName" : "Walloch",
          "location" : "South Milwaukee",
          "group" : 2,
          "title" : "Software Engineer",
      };

    let groups = [
      {
        "name" : "Web Application Team",
        "location" : ""
      }, 
      {
          "name" : "Security",
          "location" : ""
      },
      {
          "name" : "Maintenence",
          "location" : ""
      }
    ];

    let locations = [
      {
          // "expanded" : false,
          "id" : 1,
          "city" : "Milwaukee",
          "state" : "WI",
          "address" : " 777 E Wisconsin Ave",
          "zip" : "53202",
          // "associatedGroup" : [groups[0], groups[1]],
          "accessPoints" : [
            {
              "entrance" : "Main Entrance",
              "group" : "Web Applications Team",
            },
            {
              "entrance" : "Back Entrance",
              "group" : "Maintenance",
            }
          ], 
      },
      {
          "id" : 2,
          // "expanded" : false,
          "city" : "Madison",
          "state" : "WI",
          "address" : " 999 N Wesker Ave",
          "zip" : "53202",
          // "associatedGroup" : [groups[0], groups[1]],
          "accessPoints" : [
            {
              "entrance" : "Main Entrance",
              "group" : "Web Applications Team",
            },
            {
              "entrance" : "Back Entrance",
              "group" : "Maintenance",
            }
          ], 
      },
      {
        "id" : 3,
        // "expanded" : false,
        "city" : "Hales Corners",
        "state" : "WI",
        "address" : " 333 Saint Street",
        "zip" : "53130",
        // "associatedGroup" : [groups[0]], 
        //refer to a specific group's name or if multiple groups, print "Multiple Groups"
        "accessPoints" : [
          {
            "entrance" : "Main Entrance",
            "group" : "Security",
          }, //list of Entrance objects, has 1 associateGroup
        ]
      }
    ];
</script>


<main class="app-main">

  <!-- SIDE MENU -->
  <div class="left-menu">
    <div class="brand">
      <h1>Certif.<span style="color: #9c8ecf;">ID</span></h1>
      <h2>Badging System</h2>
      <nav class="menu-options">
        {#each Object.keys(pages) as page}
          <button on:click={() => changeManager(page)}>{page}</button>
        {/each}
      </nav>
    </div>

    <div>
      <p>Matt Walloch</p>
    </div>
  </div>
  
  
  <!-- RIGHT MAIN PAGE -->
  <div class="manage">
      <svelte:component this={pages[selectedManager]} {groups} {locations}/>
  </div>
</main>

