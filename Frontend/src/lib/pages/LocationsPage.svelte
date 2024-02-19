<script>
    import ContextMenu from "../../ContextMenu.svelte";
    import PageHeader from "../PageHeader.svelte";
    export let groups;
    export let locations;
    export let showModal = false;


    let colors = ["red", "blue", "green", "pink"];
    // ^Placeholder data to be changed with backend


    let contextMenuX = 0;
    let contextMenuY = 0;
    let isContextMenuVisible = false;
    let selectedItem;

    function handleRightClick(event, item) {
        event.preventDefault();
        contextMenuX = event.clientX;
        contextMenuY = event.clientY;
        selectedItem = item;
        isContextMenuVisible = true;
    };

</script>

<main>
    <PageHeader currentPage = {"Locations & Access Points"}/>
    
    <table class="data-table">
        <thead>
            <tr>
                <th class="checkbox-spacer">
                    <input type="checkbox" /> 
                </th>
                <th>Location({locations.length})</th>
                <th>Address</th>
                <th>Access Points</th>
                <th>Associated Group(s)</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            {#each locations as location, index}
                <tr class="listed-item" on:contextmenu={(event) => handleRightClick(event, location)}> 
                    <td class="checkbox-spacer">
                        <input type="checkbox" />
                    </td>
                    <td>{location.city}, {location.state}</td>
                    <td>{location.address}</td>
                    <td>{location.accessPoints}</td>
                    <td>
                        {#if location.associatedGroup.length > 1}
                            Multiple Groups
                        {:else}
                            {location.associatedGroup[0].name}
                        {/if}   
                    </td>
                    <td>
                        {#if location.associatedGroup.length > 1}
                            <button>drp</button>
                        {/if} 
                    </td>
                    <td class="final-col">
                        <button type="button" class="list-more-options">...</button>
                    </td>
                </tr>
            {/each}
            {#if isContextMenuVisible}
                <ContextMenu bind:isVisible={isContextMenuVisible} x={contextMenuX} y={contextMenuY} item={selectedItem} />
            {/if}
        </tbody>
    </table>
</main>
