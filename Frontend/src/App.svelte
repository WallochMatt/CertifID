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
        "department" : "Software Development",
        "status" : "Active",
        "obj" : "Create and maintain buisness site",
      }, 
      {
          "name" : "Security Education",
          "department" : "Security",
          "status" : "Active",
          "obj" : "Train security personel",
        },
      {
          "name" : "MKE Maintenence",
          "department" : "Maintenence",
          "status" : "Active",
          "obj" : "Maintain facility functionality and hygiene",
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
            "group" : groups[0].name,
          },
          {
            "entrance" : "Back Entrance",
            "group" : groups[2].name,
          }
        ], 
      },
      {
        "id" : 2,
        // "expanded" : false,
        "city" : "Madison",
        "state" : "WI",
        "address" : " 999 N Wesker Ave",
        "zip" : "86753",
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
          {#if page == selectedManager}
            <button on:click={() => changeManager(page)} class="selected-button">{page}</button>
          {:else}
            <button on:click={() => changeManager(page)}>{page}</button>
          {/if}
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

<style>
  .selected-button{
    background-color:black !important;
    color: white;
    border-width: 8px;
    border-style: solid;
    border-image: linear-gradient(to right, transparent 99.7%, white 75%) 1;
  }

  .menu-options{
  list-style: none;
  text-decoration: none;
  width: 100%;
  padding-inline-start: 0px;
  margin: 12vh 0vh;
  }

  .menu-options button{
    display: flex;
    align-items: center;
    justify-content: flex-start;
    background-color: #1c1c1c;
    width: 100%;
    height: 7vh;
    margin: 0.1vh 0vw;
    padding: 0em 2vw;
    font-size: large;
    border-radius: 0px;
  }
</style>