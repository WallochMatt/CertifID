<script>
    import PageHeader from "../components/PageHeader.svelte";
    import ContextMenu from "../components/ContextMenu.svelte";
    export let groups;
    export let showModal = false;


    

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
    <PageHeader currentPage = {"Groups"}/>

    <table class="data-table">
        <thead>
            <tr>
                <th class="checkbox-spacer">
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
                <tr class="listed-item" on:contextmenu={(event) => handleRightClick(event, group)}> 
                    <td class="checkbox-spacer">
                        <input type="checkbox" />
                    </td>
                    <td>{group.name}</td>
                    <td></td>
                    <td></td>
                    <td></td>
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
