<script>
    import Modal from "../../Modal.svelte";
    let showModal = false;

    let groups = [{
        "name" : "Web Application Team",
    }, 
    {
        "name" : "Security"
    }
    ]
</script>

<main>
    <div class=header-across> <!-- This may need to be instatniated on a page by page basis to create and searc the appropriate items -->
        <input class="search" placeholder="Search">
        <div>
            <button class="more-actions">More Actions...</button>
            <button class="create-button" on:click={() => (showModal = true)}>Create +</button>
        </div>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>
                    <input type="checkbox" /> 
                </th>
                <th>Group Name({groups.length})</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            {#each groups as group, index}
                <tr> 
                    <td>
                        <input type="checkbox" />
                    </td>
                    <td style="display: inline-flex;">
                        {group.name}
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="final-col">
                        <button type="button" class="list-more-options">...</button>
                    </td>
                </tr>
            {/each}
        </tbody>
    </table>
</main>
