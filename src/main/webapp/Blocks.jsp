<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.math.BigDecimal,java.sql.ResultSet,java.sql.SQLException,com.strgen,java.sql.Connection,java.sql.DriverManager,java.sql.Statement" %>
<!DOCTYPE html>
<html class="day-mode" lang="en" xml:lang="en" dir="ltr">
	<head>
		<link href="blocks_app.css"
		rel="stylesheet" id="app.css" nonce="">
		<title>
			Bitcoin Blocks
		</title>
	</head>
	<body class="">
		<div class="bg-dashboard page-block-wrap" style="height: auto;">
			<section class="page-block__header">
				<div class="breadcrumbs-wrap ">
					<img class="breadcrumbs__logo flex-shrink-0 flex-grow-0 display-block"
					src="bitcoin.svg" alt="Bitcoin blocks">
					<h1 class="breadcrumps__title h4" style="color: var(--c-txt-def);">
						Bitcoin blocks
					</h1>
				</div>
			</section>
			<div class="kuso-tables__table-wrap" style="width: 1500px;">
				<table id="kuso-table" style="width: auto;">
					<thead class="kuso-table__thead" style="position: relative; top: 0px; width: 1500px; opacity: 1;">
						<tr>
							<th data-field="id" style="">
								<div class="kuso-table__head-th-wrap hover-pointer disabled">
									<div class="kuso-table__head-th-content">
										Height
									</div>
								</div>
							</th>
							<th data-field="hash" style="">
								<div class="kuso-table__head-th-wrap hover-pointer disabled">
									<div class="kuso-table__head-th-content">
										Hash
									</div>
								</div>
							</th>
							<th data-field="time" style="">
								<div class="kuso-table__head-th-wrap hover-pointer disabled">
									<div class="kuso-table__head-th-content">
										Time
										<span>
											(UTC+8)
										</span>
									</div>
								</div>
							</th>
							<th data-field="transaction_count" style="">
								<div class="kuso-table__head-th-wrap hover-pointer disabled">
									<div class="kuso-table__head-th-content">
										Transaction count
									</div>
								</div>
							</th>
							<th data-field="output_total" style="">
								<div class="kuso-table__head-th-wrap hover-pointer disabled">
									<div class="kuso-table__head-th-content">
										Output
										<span>
											(BTC)
										</span>
									</div>
								</div>
							</th>
							<th data-field="fee_total" style="">
								<div class="kuso-table__head-th-wrap hover-pointer disabled">
									<div class="kuso-table__head-th-content">
										Fee
										<span>
											(BTC)
										</span>
									</div>
								</div>
							</th>
							<th data-field="size" style="">
								<div class="kuso-table__head-th-wrap hover-pointer disabled">
									<div class="kuso-table__head-th-content">
										Size
										<span>
											(kB)
										</span>
									</div>
								</div>
							</th>
						</tr>
					</thead>
					<tbody class="kuso-table__tbody">
						<%
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/blockchain?useUnicode=true&characterEncoding=gbk";
		con=DriverManager.getConnection(url,"root","root");
		stmt=con.createStatement();
		String sql="select a.height,a.`hash`,a.time,a.nTx,b.output,a.fee,a.size_kb from (select height,block.`hash`,from_unixtime(time) time,nTx,round(ifnull(sum(tx.fee),0),2) fee,round(block.size/1024,2) size_kb from `block`,`tx` where block.`hash`=tx.blockhash group by block.`hash`) a join (select block.`hash`,round(ifnull(sum(vout.`value`),0),2) output from `block`,`tx`,`vout` where (block.`hash`=tx.blockhash)and(tx.txid=vout.ftxid) group by block.`hash`) b on a.`hash`=b.`hash` order by a.height desc";
		rs=stmt.executeQuery(sql);
		while(rs.next()){%>
		<tr>
							<td data-field="id" class="" style="width: auto;">
								<span class="value-wrapper d-iflex ai-center">
									<span class="">
										<span class="wb-ba">
											<%=rs.getString(1)%>
										</span>
									</span>
								</span>
							</td>
							<td data-field="hash" class="" style="width: auto;">
								<div class="fs-14">
									<span class="hash-sm d-iflex ai-center p-relative">
										<a href="Block.jsp?hash=<%=rs.getString(2)%>"
										tooltip-placement="top" target="_self" style="--v-tooltip-left:50%; --v-tooltip-top:0%; --v-tooltip-translate:translate(-50%, -100%); --v-tooltip-arrow-border-top-color:var(--v-tooltip-background-color); --v-tooltip-arrow-top:calc(var(--v-tooltip-top) - var(--v-tooltip-top-offset) + 10px);"
										tabindex="-1">
											<span>
												<%=rs.getString(2)%>
											</span>
										</a>
									</span>
								</div>
							</td>
							<td data-field="time" class="" style="width: auto;">
								<span class="value-wrapper d-iflex ai-center">
									<span class="">
										<span class="wb-ba">
											<%=rs.getString(3)%>
										</span>
									</span>
								</span>
							</td>
							<td data-field="transaction_count" class="" style="width: auto;">
								<span class="value-wrapper d-iflex ai-center">
									<span class="">
										<span class="wb-ba">
											<%=rs.getString(4)%>
										</span>
									</span>
								</span>
							</td>
							<td data-field="output_total" class="" style="width: auto;">
								<span class="value-wrapper d-iflex ai-center">
									<span class="">
										<span class="wb-ba">
											<%=rs.getString(5)%>
										</span>
									</span>
								</span>
							</td>
							<td data-field="fee_total" class="" style="width: auto;">
								<span class="value-wrapper d-iflex ai-center">
									<span class="">
										<span class="wb-ba">
											<%=rs.getString(6)%>
										</span>
									</span>
								</span>
							</td>
							<td data-field="size" class="" style="width: auto;">
								<span class="value-wrapper d-iflex ai-center">
									<span class="">
										<span class="wb-ba">
											<%=rs.getString(7)%>
										</span>
									</span>
								</span>
							</td>
						</tr>
		<%}
		rs.close();
		stmt.close();
		con.close();
		%>
</tbody>
				</table>
			</div>
		</div>
	</body>

</html>