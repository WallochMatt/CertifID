<script>
    export const header = 'Create a New Location or Access Point';

    let location;
    let address;
    let associatedGroup;
    let accessPoints;

    const handleSubmit = () => {
        console.log("Submitted")
    };
</script>

<div>
    <h2>
        Create a Location or Access Point
        <hr />
    </h2>

    <form action="" method="POST" on:submit|preventDefault={handleSubmit} class="add-form"><!--  prevent default is used to stop the page from refresh -->
        
        <p class="required-field">Location</p>
        <input type="text" placeholder="" bind:value={location}>

        <p class="required-field">Address</p>
        <input type="text" placeholder="" bind:value={address}>

        <label for="associated-groups">Associated Group</label>
        <input name="associated-groups" type="text" placeholder="" bind:value={associatedGroup}>
        
        <label for="access-points">Access Points</label>
        <input name="access-points" type="text" placeholder="" bind:value={accessPoints}>
        
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