<script>
    export const header = 'Create a New Group';
    
    let groupName;

    const handleSubmit = () => {
        console.log("Submitted")
    };
</script>

<form action="" method="POST" on:submit|preventDefault={handleSubmit} class="add-form"><!--  prevent default is used to stop the page from refresh -->
    <label>
        Name of Group
        <input type="text" placeholder="" bind:value={groupName}>
    </label>
</form>