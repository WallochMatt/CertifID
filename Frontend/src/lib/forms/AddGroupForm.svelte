<script>
    export const header = 'Create a New Group';
    
    let groupName;

    const handleSubmit = () => {
        console.log("Submitted")
    };
</script>

<div>
    <h2>
        Create a Group
        <hr />
    </h2>

    <form action="" method="POST" on:submit|preventDefault={handleSubmit} class="add-form"><!--  prevent default is used to stop the page from refresh -->
        <p class="required-field">Group Name</p>
        <input type="text" placeholder="" bind:value={groupName}>
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