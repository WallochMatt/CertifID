<script>
    import PageHeader from "../PageHeader.svelte";

    export let showModal = false;

    let groups = [{
        "name" : "Web Application Team",
    }, 
    {
        "name" : "Security"
    }
    ]
</script>

<main>
    <PageHeader currentPage = {"Groups"}/>

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
