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

<div>
    <h2>
        Create a User
        <hr />
    </h2>
    
    <form action="" method="POST" on:submit|preventDefault={handleSubmit} class="add-form" ><!--  prevent default is used to stop the page from refresh -->
        

        <!-- Revisit labels, it seemed at default the label tags do not work with the required-field class -->
        <p class="required-field">Title</p>
        <input id={title} type="text" placeholder="" bind:value={title}>
        
        
        <p class="required-field">First Name</p>
        <input type="text" placeholder="" bind:value={firstName}>

        <p class="required-field">Last Name</p>
        <input type="text" placeholder="" bind:value={lastName}>

        
        <p class="required-field">Email</p>
        <input id={email} type="text" placeholder="" bind:value={email}>
        
        
        <label>
            Location(s)
            <select bind:value={location}>
                <option value="TEST 1">TEST</option>
                <option value="TEST 2">TEST</option>
                <option value="TEST 3">TEST</option>
            </select>
        </label>
        <small>
            <a>Create New</a>
            <!-- Ask about if these are intended to be hrefs or on:clicks -->
        </small>
        
        <label>
            Group(s)
            <select bind:value={group}>
                <option value="TEST 1">TEST</option>
                <option value="TEST 2">TEST</option>
                <option value="TEST 3">TEST</option>
            </select>
        </label>
        <small>
            <a>Create New</a>
        </small>
        
        <div class="modal-buttons">
            <!-- svelte-ignore a11y-autofocus -->
            <button class="close" autofocus on:click={closeModal}>Close</button>
            <!-- svelte-ignore a11y-autofocus -->
            <button class="save" on:click={handleSubmit}>Save</button> 
        </div>
    </form>
</div>

<style>
    input, select{
        height: 3vh;
        box-sizing: border-box;
        border-radius: 5px;
        border-width: 2px;
        border-style: inset;
        border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
        border-image: initial;
    }

    h2 {
        margin: 0;
        
    }

    form > p{
        margin: 0;
        margin-top: 1.5em
    }
</style>