<script lang="ts">
  import Counter from './lib/Counter.svelte'
  import { Appsettings } from '../Appsettings'
  import Routing from './lib/Routing.svelte';
  import UsersPage from './lib/pages/UsersPage.svelte';
  import GroupsPage from './lib/pages/GroupsPage.svelte';
  import LocationsPage from './lib/pages/LocationsPage.svelte';
  import AdminSettingsPage from './lib/pages/AdminSettingsPage.svelte';


  if(Appsettings.Built)
  {
     //Logic for when built by the function app
  }

  let selectedManager = 'Users';

  function changeManager(selected){
    console.log("selected is: ", selected)
    selectedManager = selected;
  }

  let pages = {
    "Users" : UsersPage,
    "Groups" : GroupsPage,
    "Locations & Access Points" : LocationsPage,
    "Admin Settings" : AdminSettingsPage,
  }

  // Users should have a picture property, defaulted to using their initials?
  let currentUser = {
        "firstName" : "Matthew",
        "lastName" : "Walloch",
        "location" : "South Milwaukee",
        "group" : 2,
        "title" : "Software Engineer",
    }

</script>


<main class="app-main">
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
  
  
  <div class="manage">
      <header class="page-legend">
        <div class="header-across">
          <h2>Manage {selectedManager}</h2>
          <div class="header-id">
            <p>{currentUser.lastName}, {currentUser.firstName}</p>
            <button class="current-user-pic">
              {currentUser.firstName[0]}{currentUser.lastName[0]}
            </button>
          </div>
        </div>
      </header>

      <svelte:component this={pages[selectedManager]} slot="slot"/>
  </div>
</main>

