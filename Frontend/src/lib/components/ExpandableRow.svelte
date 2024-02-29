<script>
    import ContextMenu from "./ContextMenu.svelte";
    export let city;
    export let state;
    export let address;
    export let zip;
    export let accessPoints = [];
    export let isChecked = false;

    let isExpanded = false;

    export function dropdown(){
        isExpanded = !isExpanded;
    }

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

<tr class="listed-item" on:contextmenu={(event) => handleRightClick(event)}> 
    <td>
        <input type="checkbox" />
    </td>
    <td>{city}, {state}</td>
    <td>
        <p>
            {address} 
        </p>
        <p>
            {city}, {state} {zip}
        </p>
    </td>
    <td>
        {#if accessPoints.length > 1}
            Multiple Groups
        {:else}
            {accessPoints[0].group}
        {/if}
    </td>
    <td>
        <button class="arrow-down"  on:click={dropdown}></button>
    </td>
    <td class="final-col">
        <button type="button" class="list-more-options">...</button>
    </td>
</tr>


{#if isExpanded}

    {#each accessPoints as accessPoint}
        <tr class="expanded-location" on:contextmenu={(event) => handleRightClick(event, accessPoint)}>
            <td class="checkbox-spacer">
                <input type="checkbox" /> 
            </td>
            <td>{accessPoint.entrance}</td>
            <td>        
                <p>
                    {address} 
                </p>
                <p>
                    {city}, {state} {zip}
                </p>
            </td>
            <td>{accessPoint.group}</td>
            <td></td>
            <td></td>
        </tr>
    {/each}

{/if}

{#if isContextMenuVisible}
    <ContextMenu bind:isVisible={isContextMenuVisible} x={contextMenuX} y={contextMenuY} item={selectedItem} />
{/if}


<style>
    .arrow-down {
        width: 0; 
        height: 0; 
        border-left: 20px solid transparent;
        border-right: 20px solid transparent;
        border-top: 20px solid #f00;
        cursor: pointer;
    }

    .expanded-location {
        width: 100%;
    }
    .expanded-location:hover{
        cursor: pointer;
        background-color: #f00;
    }
</style>