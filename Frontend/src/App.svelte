<script lang="ts">
  import { Appsettings } from '../Appsettings'
  import UsersPage from './lib/pages/UsersPage.svelte';
  import GroupsPage from './lib/pages/GroupsPage.svelte';
  import LocationsPage from './lib/pages/LocationsPage.svelte';
  import AdminSettingsPage from './lib/pages/AdminSettingsPage.svelte';
  import PageHeader from './lib/PageHeader.svelte';
  import Modal from './Modal.svelte';

  if(Appsettings.Built)
  {
    //Logic for when built by the function app
  }
  
  let selectedManager = 'Users';
  let showModal = false;
  
  function changeManager(selected){
    console.log("selected is: ", selected)
    selectedManager = selected;
  };
  


  // The selected manager acts as a key select for the pages, ex pages["Users"] instatntiates UsersPage
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
      <PageHeader bind:showModal={showModal} selectedManager={selectedManager} currentUser={currentUser} />

      <svelte:component this={pages[selectedManager]} />

      <Modal bind:showModal={showModal} selectedManager={selectedManager}> 

      </Modal>
  </div>
</main>

