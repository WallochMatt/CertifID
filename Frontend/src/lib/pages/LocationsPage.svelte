<script>
    import PageHeader from "../components/PageHeader.svelte";
    import TableMaker from "../components/TableMaker.svelte";
    import ExpandableRow from "../components/ExpandableRow.svelte";
    import ContextMenu from "../components/ContextMenu.svelte";

    export let groups;
    export let locations;
    export let showModal = false;

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
                <th>Associated Group(s)</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            {#each locations as location}

                <ExpandableRow
                    city={location.city} state={location.state} address={location.address} zip={location.zip}
                    accessPoints={location.accessPoints}
                    bind:isChecked={location.checked}
                />
            {/each}
        </tbody>
    </table>


</main>

