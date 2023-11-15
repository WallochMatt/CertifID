<script>
    import Modal from "../../Modal.svelte";
    let showModal = false;
    // api call? users will become a request -- title, group and location will likely take a numbered key
    let locations = [{
        "city" : "Milwaukee",
        "state" : "WI",
        "address" : " 777 E Wisconsin Ave, Milwauke, WI 53202",
        "associatedGroup" : "Multiple(PlaceHold)",
        "accessPoints" : 5,
    }, 
    ];
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
                <th>Location({locations.length})</th>
                <th>Address</th>
                <th>Associated Group</th>
                <th>Access Points</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            {#each locations as location, index}
                <tr> 
                    <td>
                        <input type="checkbox" />
                    </td>
                    <td>{location.city}, {location.state}</td>
                    <td>{location.address}</td>
                    <td>{location.associatedGroup}</td>
                    <td>{location.accessPoints}</td>
                    <td class="final-col">
                        <button type="button" class="list-more-options">...</button>
                    </td>
                </tr>
            {/each}
        </tbody>
    </table>
</main>

<style>
    table{
        background-color: #ffffff;
        border-collapse: collapse;
        width: 100%;
        color: black;
        margin-top: 1em;
    }

    main{
        margin: 0 2vw;
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
    }
</style>