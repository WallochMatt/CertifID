<!-- Users need: last name, firstname, location group, title -->

<script>
    import Modal from "../../Modal.svelte";
    let showModal = false;

    // api call? users will become a request -- title, group and location will likely take a numbered key
    let users = [{
        "firstName" : "Chad",
        "lastName" : "Gouin",
        "location" : "Hales Corners",
        "group" : 1,
        "title" : "Technician",
        "image" : null,
    }, 
    {
        "firstName" : "Chris",
        "lastName" : "Haliga",
        "location" : "Milwaukee",
        "group" : 1,
        "title" : "Software Engineer II",
        "image" : null,
    }
    ];

    let colors = ["red", "blue", "green", "pink"]
    
</script>

<main>
    <div class=header-across> <!-- This may need to be instatniated on a page by page basis to create and searc the appropriate items -->
        <input class="search" placeholder="Search">
        <div>
            <button class="more-actions">More Actions...</button>
            <button class="create-button" on:click={() => (showModal = true)}>Create +</button>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>
                    <input type="checkbox" /> 
                </th>
                <th>Users({users.length})</th>
                <th>Locations()</th>
                <th>Groups()</th>
                <th>Title</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            {#each users as user, index}
                <tr class="listed-user"> 
                    <td>
                        <input type="checkbox" />
                    </td>
                    <td style="display: inline-flex;">

                        <!-- Come back to this with actual images -->
                        <button type="button" class="profile" style="background-color: {colors[index]}">
                            {#if user.image === null}
                                {user.firstName[0]}{user.lastName[0]}
                            {:else}
                                <img src="-{user.image}" alt="-{user.firstName}'s Profile Picture"/>
                            {/if}
                        </button>

                        <p>{user.lastName} , {user.firstName}</p>
                    </td>
                    <td>{user.location}</td>
                    <td>{user.group}</td>
                    <td>{user.title}</td>
                    <td class="final-col">
                        <button type="button" class="list-more-options">...</button>
                    </td>
                </tr>
            {/each}
        </tbody>
    </table>
</main>

<Modal bind:showModal>
    <h2 slot="header">
        Create New User
    </h2>
    <div class="modal-div">
        <label>
            Title
        <input>
        </label>

        <label>
        First Name
        <input>
        </label>
        
        <label>
        Last Name
        <input>
        </label>

        <label>
        Email Address
        <input>
        </label>

        <label>
        Location(s)
        <select>

        </select>
        </label>
        <small>Create New</small>

        <label>
        Group(s)
        <select>

        </select>
        </label>
        <small>Create New</small>

    </div>

    
</Modal>

<style>
    main{
        margin: 0 2vw;
    }

    table{
        margin-top: 1em;
        background-color: #ffffff;
        border-collapse: collapse;
        width: 100%;
        color: black;
    }

    td, th {
        text-align: left;
        padding: 1vh 0;
    }


    th{
        border: 2px solid #7f7f7f;
        border-style: none none solid none;
        padding: 2vh 0;
    }

    input{
        color-scheme: light;
        background-color: transparent;
    }

    label {
        display: flex;
        flex-direction: column;
        padding-top: 1em;
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