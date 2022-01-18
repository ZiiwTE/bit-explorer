<%@ page language="java" import="sqlConnect.*,rpc.*,infoGet.*,java.util.LinkedHashMap,java.text.DecimalFormat,java.math.BigDecimal,java.sql.ResultSet,java.sql.SQLException,com.strgen,java.sql.Connection,java.sql.DriverManager,java.sql.Statement" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%
    String hash = request.getParameter("hash");
%>
  <!doctype html>
  <html class="day-mode" lang="en" xml:lang="en" dir="ltr">
    <%
    CoinUtils core=null;
	try {
		core = new CoinUtils();
	} catch (Throwable e) {
		e.printStackTrace();
	}
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e1) {
		e1.printStackTrace();
	}
	Connection dbc=SQLConnect.createConnect();
	Statement sma=null;
	Statement smb=null;
	Statement smc=null;
	Statement smd=null;
	Statement sml=null;
	try {
		sma=dbc.createStatement();
		smb=dbc.createStatement();
		smc=dbc.createStatement();
		smd=dbc.createStatement();
		sml=dbc.createStatement();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	//Object blockObj=core.GetBlock(hash);
	//LinkedHashMap <?,?> block=null;
	//if(blockObj instanceof LinkedHashMap<?,?>)
	//	block=(LinkedHashMap<?, ?>) blockObj;
	ResultSet dbblk=sma.executeQuery("select * from block where `hash`='"+hash+"'");
	ResultSet dborg=smb.executeQuery("select from_unixtime(time) time,nTx,block.size,block.weight,sum(fee) fee,from_unixtime(mediantime) mtime from block,tx where (block.`hash`=tx.blockhash)and(block.`hash`='"+hash+"') group by block.`hash`");
	ResultSet vin=smc.executeQuery("select ifnull(count(vin.ftxid),0) count from block,tx,vin where (block.`hash`=tx.blockhash)and(tx.txid=vin.ftxid)and(block.`hash`='"+hash+"') group by block.`hash`");
	ResultSet vout=smd.executeQuery("select count(vout.ftxid) count,sum(vout.`value`) total from block,tx,vout where (block.`hash`=tx.blockhash)and(tx.txid=vout.ftxid)and(block.`hash`='"+hash+"') group by block.`hash`");
	ResultSet list=sml.executeQuery("select a.`hash`,a.output,a.fee,a.size,b.icnt,a.ocnt from (select txid,tx.`hash`,sum(`value`) output,ifnull(fee,0) fee,size,count(txid) ocnt from tx,vout where (tx.txid=vout.ftxid)and(tx.blockhash='"+hash+"') group by txid) a, (select tx.txid,count(tx.txid) icnt from tx,vin where (tx.txid=vin.ftxid)and(tx.blockhash='"+hash+"') group by tx.txid) b where a.txid=b.txid limit 20");
	dbblk.next();
	dborg.next();
	if(vin.next()!=true)
	{
		vin=smc.executeQuery("select 0 count");
		vin.next();
	}
	vout.next();
	DecimalFormat intf = new DecimalFormat("#,##0");
	DecimalFormat doublef = new DecimalFormat("#,##0.00");
	DecimalFormat btcf = new DecimalFormat("#,##0.00000000");
    %>
    <head>
      <link href="app.css" rel="stylesheet" id="app.css" nonce="">
      <title>
			Block Information
		</title>
    </head>
    <body class="">
      <div id="app" data-v-app="">
        <div class="body">
          <div class="bg-dashboard page-block-wrap">
            <div class="container-1280 page-block-areas ">
              <section class="page-block__header">
                <div class="breadcrumbs-wrap ">
                  <img class="breadcrumbs__logo flex-shrink-0 flex-grow-0 display-block" src="bitcoin.svg" alt="Bitcoin block">
                  <div class="breadcrumbs__data">
                    <h1 class="breadcrumps__title h4" style="color: var(--c-txt-def);">Bitcoin block</h1>
                  </div>
                </div>
              </section>
              <div class="page-block__block-wrap">
                <a href="Block.jsp?hash=<%=dbblk.getString(14)%>" class="cursor-pointer page-block__block page-block__block--active">
                  <span>
                    <svg viewBox="0 0 51 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <circle cx="25.75" cy="25" r="25" fill="var(--c-block-main)">
                      </circle>
                      <path d="M35.75 20.2115H36.6C36.6 19.9384 36.4687 19.6819 36.2472 19.5221L35.75 20.2115ZM35.75 30.7885L36.2472 31.4779C36.4687 31.3181 36.6 31.0616 36.6 30.7885H35.75ZM25.75 38L25.2528 38.6894C25.5497 38.9035 25.9503 38.9035 26.2472 38.6894L25.75 38ZM15.75 30.7885H14.9C14.9 31.0616 15.0313 31.3181 15.2528 31.4779L15.75 30.7885ZM16.6 20.4231C16.6 19.9536 16.2194 19.5731 15.75 19.5731C15.2806 19.5731 14.9 19.9536 14.9 20.4231H16.6ZM15.75 20.2115L15.2528 19.5221C15.0313 19.6819 14.9 19.9384 14.9 20.2115C14.9 20.4847 15.0313 20.7412 15.2528 20.901L15.75 20.2115ZM25.75 13L26.2472 12.3106C25.9503 12.0965 25.5497 12.0965 25.2528 12.3106L25.75 13ZM34.9 20.2115V30.7885H36.6V20.2115H34.9ZM35.2528 30.099L25.2528 37.3106L26.2472 38.6894L36.2472 31.4779L35.2528 30.099ZM26.2472 37.3106L16.2472 30.099L15.2528 31.4779L25.2528 38.6894L26.2472 37.3106ZM16.6 30.7885V20.4231H14.9V30.7885H16.6ZM35.2528 19.5221L25.2528 26.7336L26.2472 28.1125L36.2472 20.901L35.2528 19.5221ZM26.2472 26.7336L16.2472 19.5221L15.2528 20.901L25.2528 28.1125L26.2472 26.7336ZM16.2472 20.901L26.2472 13.6894L25.2528 12.3106L15.2528 19.5221L16.2472 20.901ZM25.2528 13.6894L35.2528 20.901L36.2472 19.5221L26.2472 12.3106L25.2528 13.6894ZM26.6 38V27.4231H24.9V38H26.6Z" fill="var(--c-block-line)">
                      </path>
                    </svg>
                  </span>
                  <div class="d-flex fd-col mt-10 mb-10 ml-10 txt-basic">
                    <div class="page-block__block__which">Previous</div>
                    <div class="page-block__block__number"><%=intf.format(dbblk.getInt(3)-1)%></div>
                  </div>
                </a>
                <a class="page-block__block page-block__block--current">
                  <span>
                    <svg viewBox="0 0 51 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <circle cx="25.75" cy="25" r="25" fill="var(--c-block-main)">
                      </circle>
                      <path d="M35.75 20.2115H36.6C36.6 19.9384 36.4687 19.6819 36.2472 19.5221L35.75 20.2115ZM35.75 30.7885L36.2472 31.4779C36.4687 31.3181 36.6 31.0616 36.6 30.7885H35.75ZM25.75 38L25.2528 38.6894C25.5497 38.9035 25.9503 38.9035 26.2472 38.6894L25.75 38ZM15.75 30.7885H14.9C14.9 31.0616 15.0313 31.3181 15.2528 31.4779L15.75 30.7885ZM16.6 20.4231C16.6 19.9536 16.2194 19.5731 15.75 19.5731C15.2806 19.5731 14.9 19.9536 14.9 20.4231H16.6ZM15.75 20.2115L15.2528 19.5221C15.0313 19.6819 14.9 19.9384 14.9 20.2115C14.9 20.4847 15.0313 20.7412 15.2528 20.901L15.75 20.2115ZM25.75 13L26.2472 12.3106C25.9503 12.0965 25.5497 12.0965 25.2528 12.3106L25.75 13ZM34.9 20.2115V30.7885H36.6V20.2115H34.9ZM35.2528 30.099L25.2528 37.3106L26.2472 38.6894L36.2472 31.4779L35.2528 30.099ZM26.2472 37.3106L16.2472 30.099L15.2528 31.4779L25.2528 38.6894L26.2472 37.3106ZM16.6 30.7885V20.4231H14.9V30.7885H16.6ZM35.2528 19.5221L25.2528 26.7336L26.2472 28.1125L36.2472 20.901L35.2528 19.5221ZM26.2472 26.7336L16.2472 19.5221L15.2528 20.901L25.2528 28.1125L26.2472 26.7336ZM16.2472 20.901L26.2472 13.6894L25.2528 12.3106L15.2528 19.5221L16.2472 20.901ZM25.2528 13.6894L35.2528 20.901L36.2472 19.5221L26.2472 12.3106L25.2528 13.6894ZM26.6 38V27.4231H24.9V38H26.6Z" fill="var(--c-block-line)">
                      </path>
                    </svg>
                  </span>
                  <div class="d-flex fd-col mt-10 mb-10 ml-10 lh-100">
                    <div class="page-block__block__which txt-basic">Current</div>
                    <div class="page-block__block__number mt-5 h4"><%=intf.format(dbblk.getInt(3))%></div>
                  </div>
                </a>
                <a class="cursor-pointer page-block__block page-block__block--active" href="Block.jsp?hash=<%=dbblk.getString(15)%>">
                  <span>
                    <svg viewBox="0 0 51 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <circle cx="25.75" cy="25" r="25" fill="var(--c-block-main)">
                      </circle>
                      <path d="M35.75 20.2115H36.6C36.6 19.9384 36.4687 19.6819 36.2472 19.5221L35.75 20.2115ZM35.75 30.7885L36.2472 31.4779C36.4687 31.3181 36.6 31.0616 36.6 30.7885H35.75ZM25.75 38L25.2528 38.6894C25.5497 38.9035 25.9503 38.9035 26.2472 38.6894L25.75 38ZM15.75 30.7885H14.9C14.9 31.0616 15.0313 31.3181 15.2528 31.4779L15.75 30.7885ZM16.6 20.4231C16.6 19.9536 16.2194 19.5731 15.75 19.5731C15.2806 19.5731 14.9 19.9536 14.9 20.4231H16.6ZM15.75 20.2115L15.2528 19.5221C15.0313 19.6819 14.9 19.9384 14.9 20.2115C14.9 20.4847 15.0313 20.7412 15.2528 20.901L15.75 20.2115ZM25.75 13L26.2472 12.3106C25.9503 12.0965 25.5497 12.0965 25.2528 12.3106L25.75 13ZM34.9 20.2115V30.7885H36.6V20.2115H34.9ZM35.2528 30.099L25.2528 37.3106L26.2472 38.6894L36.2472 31.4779L35.2528 30.099ZM26.2472 37.3106L16.2472 30.099L15.2528 31.4779L25.2528 38.6894L26.2472 37.3106ZM16.6 30.7885V20.4231H14.9V30.7885H16.6ZM35.2528 19.5221L25.2528 26.7336L26.2472 28.1125L36.2472 20.901L35.2528 19.5221ZM26.2472 26.7336L16.2472 19.5221L15.2528 20.901L25.2528 28.1125L26.2472 26.7336ZM16.2472 20.901L26.2472 13.6894L25.2528 12.3106L15.2528 19.5221L16.2472 20.901ZM25.2528 13.6894L35.2528 20.901L36.2472 19.5221L26.2472 12.3106L25.2528 13.6894ZM26.6 38V27.4231H24.9V38H26.6Z" fill="var(--c-block-line)">
                      </path>
                    </svg>
                  </span>
                  <div class="d-flex fd-col mt-10 mb-10 ml-10 txt-basic">
                    <div class="page-block__block__which">Next</div>
                    <div class="page-block__block__number"><%=intf.format(dbblk.getInt(3)+1)%></div>
                  </div>
                </a>
              </div>
              <div class="page-block__hash-wrap shadow-block br-8 b--def bgc-bright  mt-30 ">
                <div class="page-block__hash-content">
                  <div class="font-p regular fs-14 lh-100 c-txt-quiet-gray">Hash</div>
                  <h2 class="page-block__hash__number mt-5 h4">
                    <span class="page-block__hash__hash"><%=hash%></span>
                  </h2>
                </div>
              </div>
              <div style="grid-area: stats / stats / stats / stats;">
                <div class="page-block__stats-wrap b--def   br-8--top  bgc-plain-bright">
                  <div class="dashboard-stats__wrap">
                    <h3 class="dashboard-stats__title h6m">General info</h3>
                    <div class="dashboard-stats d-grid grid-1-1">
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="txt-basic c-txt-quiet">
                            <span class="d-iblock va-mid">Mined on</span>
                          </span>
                          <div class="dashboard-stats__item">
                            <span class="txt-data c-txt-main">
                              <span class="value-wrapper d-iflex ai-center">
                                <span class="">
                                  <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=dborg.getString(1)%></span>
                                  <span class="ml-5">
                                  </span>
                                  <span style="word-break: keep-all;">UTC+8</span>
                                </span>
                                <span class="ai-center d-none">
                                  <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                    <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                    </path>
                                  </svg>
                                  <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                                </span>
                              </span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="txt-basic c-txt-quiet">
                            <span class="d-iblock va-mid">Transaction count</span>
                          </span>
                          <div class="dashboard-stats__item">
                            <span class="txt-data c-txt-main">
                              <span class="txt-data c-txt-main">
                                <span class="value-wrapper d-iflex ai-center">
                                  <span class="">
                                    <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=intf.format(dborg.getInt(2))%></span>
                                  </span>
                                  <span class="ai-center d-none">
                                    <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                      <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                      </path>
                                    </svg>
                                    <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                                  </span>
                                </span>
                              </span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="txt-basic c-txt-quiet">
                            <span class="d-iblock va-mid">Fee per kB</span>
                          </span>
                          <div class="dashboard-stats__item">
                            <span class="txt-data c-txt-main">
                              <span class="value-wrapper d-iflex ai-center">
                                <span class="">
                                  <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=btcf.format(dborg.getDouble(5)/dborg.getInt(3)*1024)%></span>
                                  <span class="ml-5">
                                  </span>
                                  <span style="word-break: keep-all;">BTC</span>
                                </span>
                                <span class="ai-center d-none">
                                  <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                    <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                    </path>
                                  </svg>
                                  <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                                </span>
                              </span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="txt-basic c-txt-quiet">
                            <span class="d-iblock va-mid">Fee per kWU</span>
                          </span>
                          <div class="dashboard-stats__item">
                            <span class="txt-data c-txt-main">
                              <span class="value-wrapper d-iflex ai-center">
                                <span class="">
                                  <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=btcf.format(dborg.getDouble(5)/dborg.getInt(4)*1000)%></span>
                                  <span class="ml-5">
                                  </span>
                                  <span style="word-break: keep-all;">BTC</span>
                                </span>
                                <span class="ai-center d-none">
                                  <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                    <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                    </path>
                                  </svg>
                                  <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                                </span>
                              </span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="txt-basic c-txt-quiet">
                            <span class="d-iblock va-mid">Input count</span>
                          </span>
                          <div class="dashboard-stats__item">
                            <span class="txt-data c-txt-main">
                              <span class="txt-data c-txt-main">
                                <span class="value-wrapper d-iflex ai-center">
                                  <span class="">
                                    <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=intf.format(vin.getInt(1)+1)%></span>
                                  </span>
                                  <span class="ai-center d-none">
                                    <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                      <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                      </path>
                                    </svg>
                                    <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                                  </span>
                                </span>
                              </span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="txt-basic c-txt-quiet">
                            <span class="d-iblock va-mid">Output count</span>
                          </span>
                          <div class="dashboard-stats__item">
                            <span class="txt-data c-txt-main">
                              <span class="txt-data c-txt-main">
                                <span class="value-wrapper d-iflex ai-center">
                                  <span class="">
                                    <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=intf.format(vout.getInt(1))%></span>
                                  </span>
                                  <span class="ai-center d-none">
                                    <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                      <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                      </path>
                                    </svg>
                                    <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                                  </span>
                                </span>
                              </span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="txt-basic c-txt-quiet">
                            <span class="d-iblock va-mid">Output total</span>
                          </span>
                          <div class="dashboard-stats__item">
                            <span class="txt-data c-txt-main">
                              <span class="value-wrapper d-iflex ai-center">
                                <span class="">
                                  <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=doublef.format(vout.getDouble(2))%></span>
                                  <span class="ml-5">
                                  </span>
                                  <span style="word-break: keep-all;">BTC</span>
                                </span>
                                <span class="ai-center d-none">
                                  <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                    <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                    </path>
                                  </svg>
                                  <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                                </span>
                              </span>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="txt-basic c-txt-quiet">
                            <span class="d-iblock va-mid">Fee total</span>
                          </span>
                          <div class="dashboard-stats__item">
                            <span class="txt-data c-txt-main">
                              <span class="value-wrapper d-iflex ai-center">
                                <span class="">
                                  <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=btcf.format(dborg.getDouble(5))%></span>
                                  <span class="ml-5">
                                  </span>
                                  <span style="word-break: keep-all;">BTC</span>
                                </span>
                                <span class="ai-center d-none">
                                  <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                    <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                    </path>
                                  </svg>
                                  <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                                </span>
                              </span>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="br-8--bottom bgc-plain-bright b--def">
                  <div class="expandable-stats">
                    <input type="checkbox" class="expandable-stats__checkbox" id="expandable-stats__checkbox">
                    <label class="expandable-stats__label mlr-auto font-h regular fs-14 lh-100 c-txt-main inline-link hover-pointer d-flex ai-center" for="expandable-stats__checkbox">
                      <span class="expandable-stats__checkmark ml-5 d-flex ai-center">
                        <svg width="6" height="8" viewBox="0 0 6 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M6 4L8.34742e-08 7.5L0 0.5L6 4Z" fill="var(--c-accent--co)">
                          </path>
                        </svg>
                      </span>Technical details</label>
                    <div class="expandable-stats__expand w-100 dashboard-stats d-grid grid-1-1">
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="regular c-txt-quiet">Size</span>
                          <span class="medium c-txt-main">
                            <span class="value-wrapper d-iflex ai-center">
                              <span class="">
                                <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=intf.format(dbblk.getInt(17))%></span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="regular c-txt-quiet">Weight</span>
                          <span class="medium c-txt-main">
                            <span class="value-wrapper d-iflex ai-center">
                              <span class="">
                                <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=intf.format(dbblk.getInt(18))%></span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="regular c-txt-quiet">Stripped size</span>
                          <span class="medium c-txt-main">
                            <span class="value-wrapper d-iflex ai-center">
                              <span class="">
                                <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=intf.format(dbblk.getInt(16))%></span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="regular c-txt-quiet">Median time</span>
                          <span class="medium c-txt-main">
                            <span class="value-wrapper d-iflex ai-center">
                              <span class="">
                                <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=dborg.getString(6)%></span>
                                <span class="ml-5">
                                </span>
                                <span style="word-break: keep-all;">UTC+8</span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="regular c-txt-quiet">Version</span>
                          <span class="medium c-txt-main">
                            <span class="value-wrapper d-iflex ai-center">
                              <span class="">
                                <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=dbblk.getString(4)%></span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="regular c-txt-quiet">Merkle root</span>
                          <span class="medium c-txt-main">
                            <span class="value-wrapper d-iflex ai-center">
                              <span class="hash-sm__hash-wrap d-iflex ai-center">
                                <span class="rtl-preserve data-v-tooltip" data-v-tooltip="<%=dbblk.getString(6)%>" style="--v-tooltip-max-width:400px; --v-tooltip-word-break:break-word; --v-tooltip-left:50%; --v-tooltip-top:0%; --v-tooltip-translate:translate(-50%, -100%); --v-tooltip-arrow-border-top-color:var(--v-tooltip-background-color); --v-tooltip-arrow-top:calc(var(--v-tooltip-top) - var(--v-tooltip-top-offset) + 10px);" tabindex="-1">
                                  <span><%=dbblk.getString(6).substring(0,8)+"..."%></span>
                                </span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="regular c-txt-quiet">Difficulty</span>
                          <span class="medium c-txt-main">
                            <span class="value-wrapper d-iflex ai-center">
                              <span class="">
                                <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=intf.format(dbblk.getDouble(11))%></span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="regular c-txt-quiet">Nonce</span>
                          <span class="medium c-txt-main">
                            <span class="value-wrapper d-iflex ai-center">
                              <span class="">
                                <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=intf.format(dbblk.getLong(9))%></span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="regular c-txt-quiet">Bits</span>
                          <span class="medium c-txt-main">
                            <span class="value-wrapper d-iflex ai-center">
                              <span class="">
                                <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=dbblk.getString(10)%></span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                      <div class="">
                        <div class="dashboard-stats__item d-grid font-p fs-14 ">
                          <span class="regular c-txt-quiet">Chainwork</span>
                          <span class="medium c-txt-main">
                            <span class="value-wrapper d-iflex ai-center">
                              <span class="hash-sm__hash-wrap d-iflex ai-center">
                                <span class="rtl-preserve data-v-tooltip" data-v-tooltip="<%=dbblk.getString(12)%>" style="--v-tooltip-max-width:400px; --v-tooltip-word-break:break-word; --v-tooltip-left:50%; --v-tooltip-top:0%; --v-tooltip-translate:translate(-50%, -100%); --v-tooltip-arrow-border-top-color:var(--v-tooltip-background-color); --v-tooltip-arrow-top:calc(var(--v-tooltip-top) - var(--v-tooltip-top-offset) + 10px);" tabindex="-1">
                                  <span><%="..."+dbblk.getString(12).substring(56,64)%></span>
                                </span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                      <div class=" lg-grid-span-2 grid-sm-1col ">
                        <div class="dashboard-stats__item d-grid font-p fs-14  span-2 ">
                          <span class="regular c-txt-quiet">Coinbase data</span>
                          <span class="medium c-txt-main">
                            <span class="value-raw-like c-txt-quiet font-mono value-wrapper d-iflex ai-center">
                              <span class="">
                                <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"></span>
                              </span>
                              <span class="ai-center d-none">
                                <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                  <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                  </path>
                                </svg>
                                <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                              </span>
                            </span>
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="page-block__table-wrap">
                <div class="dashboard-tables d-grid" style="grid-template-columns: auto;">
                  <div class="btable-wrap of-hidden" entity="block">
                    <h3 class="h6m c-txt-main d-iblock mb-15">Transactions included in this block</h3>
                    <div class="br-8 b--def bgc-plain-bright pb-10">
                      <div class="btable-table-wrap maxh-none">
                        <table class="btable-table w-100">
                          <thead class="">
                            <tr>
                              <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Hash</th>
                              <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Output total</th>
                              <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Transaction fee</th>
                              <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Fee per kB</th>
                              <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Size</th>
                              <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Input count</th>
                              <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Output count</th>
                            </tr>
                          </thead>
                          <tbody class="bgc-white">
                          <%while(list.next()){%>
                            <tr>
                              <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                                <span class="value-wrapper d-iflex ai-center null">
                                  <span class="">
                                    <span class="wb-ba"><%=list.getString(1)%></span>
                                  </span>
                                </span>
                              </td>
                              <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                                <span class="value-wrapper d-iflex ai-center null">
                                  <span class="rtl-preserve">
                                    <span class="wb-ba"><%=btcf.format(list.getDouble(2))%></span>
                                    <span style="margin-left: 5px; word-break: keep-all;">BTC</span>
                                  </span>
                                </span>
                              </td>
                              <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                                <span class="value-wrapper d-iflex ai-center null">
                                  <span class="rtl-preserve">
                                    <span class="wb-ba"><%=btcf.format(list.getDouble(3))%></span>
                                    <span style="margin-left: 5px; word-break: keep-all;">BTC</span>
                                  </span>
                                </span>
                              </td>
                              <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                                <span class="value-wrapper d-iflex ai-center null">
                                  <span class="rtl-preserve">
                                    <span class="wb-ba"><%=btcf.format(list.getDouble(3)/list.getInt(4)*1024)%></span>
                                    <span style="margin-left: 5px; word-break: keep-all;">BTC</span>
                                  </span>
                                </span>
                              </td>
                              <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                                <span class="value-wrapper d-iflex ai-center null">
                                  <span class="">
                                    <span class="wb-ba"><%=list.getInt(4)%></span>
                                  </span>
                                </span>
                              </td>
                              <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                                <span class="value-wrapper d-iflex ai-center null">
                                  <span class="">
                                    <span class="wb-ba"><%=list.getInt(5)%></span>
                                  </span>
                                </span>
                              </td>
                              <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                                <span class="value-wrapper d-iflex ai-center null">
                                  <span class="">
                                    <span class="wb-ba"><%=list.getInt(6)%></span>
                                  </span>
                                </span>
                              </td>
                            </tr>
                            <%}
                            dbblk.close();
                            dborg.close();
                            vin.close();
                            vout.close();
                            list.close();
                            sma.close();;
                            smb.close();;
                            smc.close();;
                            smd.close();;
                            sml.close();
                            %>
                          </tbody>
                        </table>
                      </div>
                      <a href="/bitcoin/transactions?q=block_id(716618)&amp;limit=20&amp;s=id(asc)" class="btable-button hover-pointer button primary p-relative d-iblock ml-10 " style="display: none;">Explore transactions
                        <span class="btable-button__badge ml-10 medium fs-12">10</span>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </body>
  
  </html>