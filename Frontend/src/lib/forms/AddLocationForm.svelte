<script>
    let location;
    let address;
    let associatedGroup;
    let accessPoints;

    const handleSubmit = () => {
        console.log("Submitted")
    }
</script>

<form on:submit|preventDefault={handleSubmit} class="add-form"><!--  prevent default is used to stop the page from refresh -->
    <label>
        Location
        <input type="text" placeholder="" bind:value={location}>
    </label>
    <label>
        Address
        <input type="text" placeholder="" bind:value={address}>
    </label>
    <label>
        Associated Group
        <input type="text" placeholder="" bind:value={associatedGroup}>
    </label>
    <label>
        Access Poitns
        <input type="text" placeholder="" bind:value={accessPoints}>
    </label>
</form>