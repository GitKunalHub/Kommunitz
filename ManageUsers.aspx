<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="ManageUsers.aspx.vb" Inherits="ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <main class="content">
				<div class="container-fluid p-0">
                   

               

					<h1 class="h3 mb-3"><strong>Analytics</strong> Dashboard</h1>

                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="Button"></asp:Button>

					<div class="row">
						<div class="col-xl-6 col-xxl-5 d-flex">
							<div class="w-100">
								<div class="row">
									<div class="col-sm-6">
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Users today</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="truck"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">13</h1>
												<div class="mb-0">
													<span class="text-danger"> <i class="mdi mdi-arrow-bottom-right"></i> -1.65% </span>
													<span class="text-muted">Since last week</span>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="card">
											<div class="card-body">
												<div class="row">
													<div class="col mt-0">
														<h5 class="card-title">Earnings</h5>
													</div>

													<div class="col-auto">
														<div class="stat text-primary">
															<i class="align-middle" data-feather="dollar-sign"></i>
														</div>
													</div>
												</div>
												<h1 class="mt-1 mb-3">0</h1>
												<div class="mb-0">
													<span class="text-success"> <i class="mdi mdi-arrow-bottom-right"></i> 0 </span>
													<span class="text-muted">Since last week</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
            		</div>
					
					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">Top Grossing Communities</h5>
								</div>
                                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <table class="table table-hover my-0">
									<thead>
										<tr>
											<th>Name</th>
											<th class="d-none d-xl-table-cell">Post_Ref_ID</th>
											<th class="d-none d-xl-table-cell">Community Name</th>
											<th>Post Title</th>
											<th class="d-none d-md-table-cell">Engagements</th>
                                            <th class="d-none d-md-table-cell">Date</th>
										</tr>
									</thead>
									<tbody>
                                        <tr>
                                            <td class="d-none d-md-table-cell"><asp:Label ID="lblCreatedBy" runat="server" Text='<%#Eval("Username") %>'>'></asp:Label></td>
                                            <td class="d-none d-xl-table-cell"><asp:Label ID="lblPRI" runat="server" Text='<%#Eval("Post_Ref_ID")%>'>'></asp:Label></td>
											<td><asp:Label ID="lblName" runat="server" Text='<%#Eval("Kommunity_Name") %>'>'></asp:Label></td>
											<td class="d-none d-xl-table-cell"><asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Content_Title")%>'>'></asp:Label></td>
											<td><span class="badge bg-success"><asp:Label ID="lblGrowth" runat="server" Text='<%#Eval("Upvote") %>'>'></asp:Label></span></td>
                                            <td class="d-none d-md-table-cell"><asp:Label ID="lblCreated_On" runat="server" Text='<%#Eval("Posted_On") %>'>'></asp:Label></td>
										</tr>
                                    </tbody>
								</table>
                                        </ItemTemplate>
                                </asp:DataList>								
							    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT * FROM [tblContent] WHERE ([Username] = @Username)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtSearch" Name="Username" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
							</div>
						</div>
					</div>
				</div>
			</main>
               
			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="DemoHome2.aspx" target="_blank"><strong>Kommunitz</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
    </asp:Content>

