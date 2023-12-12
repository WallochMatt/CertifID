<script>
    export const header = 'Create a New User';
    export let closeModal; 


    function handleSubmit() {
        console.log("Submitted");
        alert("Form saved!");
        // This would make the post request
        closeModal();
    }

    let title;
    let firstName;
    let lastName;
    let email

    let location = [];
    let group = [];
</script>


<form action="" method="POST" on:submit|preventDefault={handleSubmit} class="add-form" ><!--  prevent default is used to stop the page from refresh -->
    <label>
        Title
        <input type="text" placeholder="" bind:value={title}>
    </label>

    <label>
        First Name
        <input type="text" placeholder="" bind:value={firstName}>
    </label>
    
    <label>
        Last Name
        <input type="text" placeholder="" bind:value={lastName}>
    </label>

    <label>
        Email Address
        <input type="text" placeholder="" bind:value={email}>
    </label>

    <label>
        Location(s)
        <select bind:value={location}>
            <option value="TEST 1">TEST</option>
            <option value="TEST 2">TEST</option>
            <option value="TEST 3">TEST</option>
        </select>
    </label>
    <small>Create New</small>

    <label>
        Group(s)
        <select bind:value={group}>
            <option value="TEST 1">TEST</option>
            <option value="TEST 2">TEST</option>
            <option value="TEST 3">TEST</option>
        </select>
    </label>
    <small>Create New</small>

    <div class="modal-buttons">
        <!-- svelte-ignore a11y-autofocus -->
        <button class="close" autofocus on:click={closeModal}>Close</button>
        <!-- svelte-ignore a11y-autofocus -->
        <button class="save" on:click={handleSubmit}>Save</button> 
    </div>
</form>

