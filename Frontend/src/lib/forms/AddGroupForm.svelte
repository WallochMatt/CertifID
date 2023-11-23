<script>
    let groupName;

    const handleSubmit = () => {
        console.log("Submitted")
    }
</script>

<form on:submit|preventDefault={handleSubmit} class="add-form"><!--  prevent default is used to stop the page from refresh -->
    <label>
        Name of Group
        <input type="text" placeholder="" bind:value={groupName}>
    </label>
</form>