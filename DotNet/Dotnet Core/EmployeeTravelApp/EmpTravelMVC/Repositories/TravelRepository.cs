using System.Data;
using Microsoft.Data.SqlClient;
using EmpTravelMVC.Models;
using EmpTravelMVC.Interfaces;

namespace EmpTravelMVC.Repositories
{
    public class TravelRepository : ITravelRepository
    {
        private readonly string _connectionString;

        public TravelRepository(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("DefaultConnection");
        }

        //Getting all travel requests
        public List<TravelRequest> GetAll()
        {
            List<TravelRequest> list = new List<TravelRequest>();
            using(SqlConnection con = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetAllRequests", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    list.Add(new TravelRequest
                    {
                        RequestId = (int)reader["RequestId"],
                        EmployeeId = (int)reader["EmployeeId"],
                        Destination = reader["Destination"].ToString(),
                        StartDate = (DateTime)reader["StartDate"],
                        EndDate = (DateTime)reader["EndDate"],
                        Status = reader["Status"].ToString()
                    });
                }
            }
            return list;
        }
        //Getting a travel request by id
        public TravelRequest GetById(int id)
        {
            TravelRequest request = null;
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetRequestsById", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmployeeId", id);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    request = new TravelRequest
                    {
                        RequestId = (int)reader["RequestId"],
                        EmployeeId = (int)reader["EmployeeId"],
                        Destination = reader["Destination"].ToString(),
                        StartDate = (DateTime)reader["StartDate"],
                        EndDate = (DateTime)reader["EndDate"],
                        Status = reader["Status"].ToString()
                    };
                }
            }
            return request;
        }

        //Adding a new travel request
        public void Add(TravelRequest request)
        {
            using(SqlConnection con = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("spAddTravelRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmployeeId", request.EmployeeId);
                cmd.Parameters.AddWithValue("@Destination", request.Destination);
                cmd.Parameters.AddWithValue("@StartDate", request.StartDate);
                cmd.Parameters.AddWithValue("@EndDate", request.EndDate);
                cmd.Parameters.AddWithValue("@Status", request.Status);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //Updateing an existing travel request
        public void Update(TravelRequest request)
        {
            using(SqlConnection con = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("spUpdateRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RequestId", request.RequestId);
                cmd.Parameters.AddWithValue("@EmployeeId", request.EmployeeId);
                cmd.Parameters.AddWithValue("@Destination", request.Destination);
                cmd.Parameters.AddWithValue("@StartDate", request.StartDate);
                cmd.Parameters.AddWithValue("@EndDate", request.EndDate);
                cmd.Parameters.AddWithValue("@Status", request.Status);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //Deleting a travel request
        public void Delete(int id)
        {
            using(SqlConnection con = new SqlConnection(_connectionString))
            {
                SqlCommand cmd = new SqlCommand("spDeleteRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RequestId", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}