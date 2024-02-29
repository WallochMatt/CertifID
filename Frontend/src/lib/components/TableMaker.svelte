NOTE: This component is inoperable but will remain until deemed entirely unneeded



<script>
    import ContextMenu from "./ContextMenu.svelte";
    import dropdown from "./ExpandableRow.svelte";

    export let contents;
    export let columns = [];
    export let rows = [];

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
    
    console.log(contents)
</script>

<table class="data-table">
    <thead>
        <tr>
            <th class="checkbox-spacer">
                <input type="checkbox" /> 
            </th>
            {#each columns as column}
                <th>{column}</th>
            {/each}
        </tr>
    </thead>

    <tbody>
    
        {#each contents as content}
        
        <tr class="listed-item" on:contextmenu={(event) => handleRightClick(event, content)}> 
            <td class="checkbox-spacer">
                <input type="checkbox" />
            </td>

            {#each rows as row}
                <td>{content[`${row}`]}</td>
            {/each}


            <td class="final-col">
                <button type="button" class="list-more-options">...</button>
            </td>
        </tr>
        {/each}
    </tbody>
</table>
{#if isContextMenuVisible}
    <ContextMenu bind:isVisible={isContextMenuVisible} x={contextMenuX} y={contextMenuY} item={selectedItem} />
{/if}












