<script>
    import Modal from "../Modal.svelte";
    import AddGroupForm from "./forms/AddGroupForm.svelte";
    import AddLocationForm from "./forms/AddLocationForm.svelte";
    import AddUserForm from "./forms/AddUserForm.svelte";

    let showModal = false;

    export let selectedManager;
    export let currentUser;
    export let pages;
    
    function closeModal(){
		showModal = false;
	};

    let forms = {
        "Users" : AddUserForm,  
        "Groups" : AddGroupForm,
        "Locations" : AddLocationForm
    };
</script>

<Modal entity={selectedManager} bind:showModal={showModal} > 
    <!-- Props from Add? Add > USERPAGE > MODAL? -->
    <svelte:component this={forms[selectedManager]} slot="form" {closeModal} />
</Modal>

<header class="page-legend">
    <div class="header-across header-above">
        <h2>Manage {selectedManager}</h2>
        <div class="header-id">
            <p>{currentUser.lastName}, {currentUser.firstName}</p>
            <button class="current-user-pic">
                {currentUser.firstName[0]}{currentUser.lastName[0]}
            </button>
        </div>
    </div>

    <div class=header-across> <!-- This may need to be instatniated on a page by page basis to create and searc the appropriate items -->
        <input class="search" placeholder="Search">
        <div>
            <button class="more-actions">More Actions...</button>
            <button class="create-button" on:click={() => showModal = true}>Create +</button>
        </div>
    </div>
</header>

<svelte:component this={pages[selectedManager]} slot="slot"/>
