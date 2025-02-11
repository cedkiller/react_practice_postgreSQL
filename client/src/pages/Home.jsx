import React, {useState, useEffect} from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import axios from 'axios';
import Swal from 'sweetalert2';
import '../assets/css/Style.css';

function Home () {
    const navigate = useNavigate();
    const [task, setTask] = useState("");
    const [record, setRecord] = useState([]);

    useEffect(() => {
        getRecord();
    }, [])

    const getRecord = async () => {
        try {
            const response = await axios.get('http://localhost:5000/record');

            setRecord(response.data.results);
        } catch (error) {
            
        }
    }

    const submit = async (e) => {
        e.preventDefault();

        try {
            const response = await axios.post('http://localhost:5000/add_task', {task});

            if (response.data.message === "success")
            {
                Swal.fire({
                    title:'Task Added',
                    text:'The task has been added successfuilly',
                    icon:'success'
                }).then((result) => {
                    if (result.isConfirmed) {
                        setTask("");
                        getRecord();
                        navigate('/');
                    }
                })
            }
        } catch (error) {
            if (error) {
                Swal.fire({
                    title:'Error Adding Task',
                    text:'There have been error in adding a task',
                    icon:'error'
                }).then((result) => {
                    if (result.isConfirmed) {
                        setTask("");
                        getRecord();
                        navigate('/');
                    }
                })
            }
        }
    }

    const edit = async (id) => {
        navigate(`/Edit/${id}`);
    }

    const del = async (id) => {
        try {
            const response = await axios.delete(`http://localhost:5000/delete_task/${id}`);

            if (response.data.message === "success") {
                Swal.fire({
                    title:'Task Deleted',
                    text:'The task has been deleted successfully',
                    icon:'success'
                }).then((result) => {
                    if (result.isConfirmed) {
                        setTask("");
                        getRecord();
                        navigate('/');
                    }
                })
            }
        } catch (error) {
            if (error) {
                Swal.fire({
                    title:'Error Deleting Task',
                    text:'There have been error in deleting task',
                    icon:'error'
                }).then((result) => {
                    if (result.isConfirmed) {
                        setTask("");
                        getRecord();
                        navigate('/');
                    }
                })
            }
        }
    }
    return (
        <>
        <br />
        <div style={{display:'flex', justifyContent:'center'}}>
            <div className='div'>
                <form onSubmit={submit}>
                    <div style={{display:'flex'}}>
                        <input type="text" placeholder='Enter a task' value={task} onChange={(e) => setTask(e.target.value)} className='form-control' />
                        <button className='btn btn-primary' style={{marginLeft:15}}>Enter</button>
                    </div>
                </form>
            </div>
        </div>
        <br />
        <div style={{display:'flex', justifyContent:'center'}}>
            <table className='table'>
                <thead>
                    <th style={{textAlign:'center', fontSize:20, height:50, backgroundColor:'black', color:'white'}}>Task</th>
                    <th style={{textAlign:'center', fontSize:20, height:50, backgroundColor:'black', color:'white'}}>Action</th>
                </thead>

                {record.map((rec) => (
                <tbody key={rec.id}>
                    <td style={{textAlign:'center', fontSize:17, height:30}}>{rec.task}</td>
                    <td style={{textAlign:'center', fontSize:17, height:30}}><button className='btn btn-warning' onClick={() => edit(rec.id)}>Edit</button> <button className='btn btn-danger' onClick={() => del(rec.id)}>Delete</button></td>
                </tbody>
                ))}
            </table>
        </div>
        </>
    );
}

export default Home;