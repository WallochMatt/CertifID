<script>
    export let componentName;
</script>

{#if componentName === 0}
    <p>Users</p>
{:else if componentName === 1}
    <p>Groups</p>
{:else if componentName === 2}
    <p>Locations</p>
{/if}