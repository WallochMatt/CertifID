<script>
    export let city;
    export let state;
    export let address;
    export let zip;
    export let children = [];
    export let isChecked = false;

    let isExpanded = false;

    function dropdown(){
        isExpanded = !isExpanded;
    }
</script>

<tr on:click={dropdown}>
    <td class="checkbox-spacer">
        <input type="checkbox" bind:value={isChecked}/> 
    </td>
    <td>{city}</td>
    <td>{state}</td>
    <td>{address}</td>
    <td>{zip}</td>
</tr>
{#if isExpanded}
    {#each children as child}
        <tr >
            <td class="checkbox-spacer">
                <input type="checkbox" /> 
            </td>
            <td>{child.entrance}</td>
            <td>{state}</td>
            <td>{address}</td>
        </tr>
    {/each}
{/if}
