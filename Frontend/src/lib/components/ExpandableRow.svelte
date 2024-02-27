<script>
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
</script>

<tr>
    <td class="checkbox-spacer">
        <input type="checkbox" bind:value={isChecked}/> 
    </td>
    <td>{city}, {state}</td>
    <td>{address}, {city}, {state} {zip}</td>
    <td>
        {#if accessPoints.length > 1}
            Multple Groups
        {:else}
            {accessPoints[0].group}
        {/if}
    </td>
    <td>
        {#if accessPoints.length > 1}
            <button on:click={() => dropdown()}>drp</button>
        {/if}
    </td>
    <td class="final-col">
        <button type="button" class="list-more-options">...</button>
    </td>
</tr>

{#if isExpanded}
    {#each accessPoints as accessPoint}
        <tr >
            <td class="checkbox-spacer">
                <input type="checkbox" /> 
            </td>
            <td>{accessPoint.entrance}</td>
            <td>{state}</td>
            <td>{address}</td>
        </tr>
    {/each}
{/if}

