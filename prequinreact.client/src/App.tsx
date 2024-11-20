import { useEffect, useState } from 'react';
import './App.css';
import { AgGridReact } from 'ag-grid-react';
import { ColDef } from 'ag-grid-community';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';

interface Investor {
    investorId: number,
    investorName: string,
    investorType: string,
    totalCommitment: number
    investorCountry: string,
}

interface InvestorCommitsBreakdown {
    id: number,
    investorId: number,
    commitmentassetclass: string,
    commitmentamount: number,
    commitmentcurrency: string
}

function App() {
    const [columnDefsInvestors] = useState<ColDef[]>([
        { field: 'investorName', headerName: 'Investor Name', sortable: true, filter: false },
        { field: 'investorType', headerName: 'Investor Type', sortable: true, filter: true },
        { field: 'investorCountry', headerName: 'Country', sortable: true, filter: true },
        { field: 'totalCommitment', headerName: 'Commitment Summary', sortable: true, filter: false },
    ]);

    const [columnDefsBreakdown] = useState<ColDef[]>([
        { field: 'id', headerName: 'ID', sortable: true, filter: true },
        { field: 'investorId', headerName: 'Investor ID', sortable: true, filter: true },
        { field: 'commitmentassetclass', headerName: 'Asset Class', sortable: true, filter: true },
        { field: 'commitmentamount', headerName: 'Commitment Amount', sortable: true, filter: true },
        { field: 'commitmentcurrency', headerName: 'Currency', sortable: true, filter: true },
    ]);

    const [investors, setInvestors] = useState<Investor[]>();
    const [investorBreakdown, setInvestorBreakdown] = useState<InvestorCommitsBreakdown[]>([]); // Set as an empty array
    const [investorSubtotals, setInvestorSubtotals] = useState<{ [key: string]: number }>({});

    useEffect(() => {
        populateInvestorSummary();
    }, []);

    useEffect(() => {
        if (investorBreakdown.length > 0) {
            const subtotals = investorBreakdown.reduce((acc, breakdown) => {
                const { commitmentassetclass, commitmentamount } = breakdown;
                if (acc[commitmentassetclass]) {
                    acc[commitmentassetclass] += commitmentamount;
                } else {
                    acc[commitmentassetclass] = commitmentamount;
                }
                return acc;
            }, {} as { [key: string]: number });

            setInvestorSubtotals(subtotals);
        }
    }, [investorBreakdown]); // Recalculate whenever investorBreakdown updates

    async function populateInvestorSummary() {
        const response = await fetch('/api/investorsSummary');
        if (response.ok) {
            const data = await response.json();
            setInvestors(data.data);
        }
    }

    async function populateInvestorBreakdown(investorId: number) {
        const response = await fetch(`/api/investorBreakdown?investorId=${investorId}`);
        if (response.ok) {
            const data = await response.json();
            setInvestorBreakdown(data.data); // This triggers the effect to calculate subtotals
        }
    }

    const handleClickInvestor = (e: any) => {
        populateInvestorBreakdown(e.data.investorId);
    }

    return (
        <div>

            <div>
                <h1 id="tableLabel">Investors</h1>
                <p>List of Investors</p>
            </div>
            <div style={{ display: 'flex', justifyContent: 'center', width: '100%', marginBottom: "50px" }}>
                <div className="ag-theme-alpine" style={{ height: 220, width: '60%' }}>
                    <AgGridReact
                        rowData={investors}
                        columnDefs={columnDefsInvestors}
                        onRowClicked={(e) => handleClickInvestor(e)}
                        defaultColDef={{
                            flex: 1,
                            filter: true,
                        }}
                    />
                </div>
            </div>

            <div style={{ display: 'flex', justifyContent: 'center', width: '100%', marginTop: '20px' }}>
                <div>
                    <h2 style={{ textAlign: 'center' }}>Subtotals by Commitment Asset Class</h2>
                    <table style={{ margin: '0 auto', borderCollapse: 'collapse' }}>
                        <thead>
                            <tr>
                                <th>Asset Class</th>
                                <th>Subtotal Commitment Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            {Object.entries(investorSubtotals).map(([assetClass, subtotal]) => (
                                <tr key={assetClass}>
                                    <td>{assetClass}</td>
                                    <td>{subtotal.toFixed(2)} GBP</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>

            <div className="ag-theme-alpine" style={{ height: 600, width: '100%' }}>
                <AgGridReact
                    rowData={investorBreakdown}
                    columnDefs={columnDefsBreakdown}
                    defaultColDef={{
                        flex: 1,
                        filter: true,
                    }}
                />
            </div>

        </div>
    );
}

export default App;
