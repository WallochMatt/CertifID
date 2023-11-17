<script>
    let title;
    let firstName;
    let lastName;
    let email

    let location = [];
    let group = [];

    const handleSubmit = () => {
        console.log("Submitted")
    }

</script>

<main>
    <form on:submit|preventDefault={handleSubmit} class="modal-div"><!--  prevent default is used to stop the page from refresh -->
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
    </form >
</main>


<style>
    label {
            display: flex;
            flex-direction: column;
            padding-top: 1em;
        }

    input{
        color-scheme: light;
        background-color: transparent;
    }

    select, option {
        color: black;
    }

    small {
        width: 100%;
        display: flex;
        justify-content: flex-end;
        flex-wrap: nowrap;
    }

    select {
        width: 100%;
        background-color: transparent;
    }
</style>