<%@ page language="java" import="infoGet.*,java.text.DecimalFormat,java.math.BigDecimal,java.sql.ResultSet,java.sql.SQLException,com.strgen,java.sql.Connection,java.sql.DriverManager,java.sql.Statement" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="day-mode" lang="en" xml:lang="en" dir="ltr">
  
  <head>
    <link href="blocks_app.css" rel="stylesheet" id="app.css" nonce="">
    <title>
			Bitcoin Blockchain Explorer
		</title>
  </head>
  
  <body class="">
  <%InfoStorage infos=new InfoStorage();%>
    <div id="app" data-v-app="">
      <div class="body">
        <div class="bg-dashboard">
          <div class="container-1280">
            <div class="dashboard-wrap d-grid">
              <main class="dashboard-main-wrap d-grid ai-start">
                <div class="dashboard-main d-grid ai-start sm-order-0">
                  <div class="breadcrumbs-wrap dashboard">
                    <img class="breadcrumbs__logo flex-shrink-0 flex-grow-0 display-block" src="bitcoin.svg" alt="Bitcoin">
                    <div class="breadcrumbs__data">
                      <h1 class="breadcrumps__title h2" style="color: var(--c-txt-def);">Bitcoin</h1>
                    </div>
                  </div>
                </div>
                <div class="dashboard-main__general d-grid ji-start mt-20 mb-20 sm-order-1">
                  <a href="Blocks.jsp" class="dashboard-main__general__item hover-pointer c-txt-accent ">
                    <span class="dashboard-main__general__item__icon">
                      <svg width="50" height="50" viewBox="0 0 51 51" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M50 25C50 38.8071 38.8071 50 25 50C11.1929 50 0 38.8071 0 25C0 11.1929 11.1929 0 25 0C38.8071 0 50 11.1929 50 25Z" fill="var(--c-svg-main)">
                        </path>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M18.4535 22.311C18.7506 22.0964 19.1518 22.0964 19.4489 22.311L25.4002 26.6101C25.6215 26.7699 25.7525 27.0263 25.7525 27.2992V33.6046C25.7525 33.8775 25.6215 34.1338 25.4002 34.2936L19.4489 38.5927C19.1518 38.8074 18.7506 38.8074 18.4535 38.5927L12.5022 34.2936C12.2809 34.1338 12.1499 33.8775 12.1499 33.6046V27.4253C12.1499 27.404 12.1507 27.3829 12.1522 27.362C12.1507 27.3412 12.1499 27.3202 12.1499 27.2992C12.1499 27.0263 12.2809 26.7699 12.5022 26.6101L18.4535 22.311ZM13.8499 28.9618V33.17L18.1012 36.2411V32.0329L13.8499 28.9618ZM19.8012 32.0329V36.2411L24.0525 33.17V28.9618L19.8012 32.0329ZM23.451 27.2992L18.9512 30.5497L14.4515 27.2992L18.9512 24.0486L23.451 27.2992Z" fill="var(--c-svg-add)">
                        </path>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M30.4535 22.311C30.7506 22.0964 31.1518 22.0964 31.4489 22.311L37.4002 26.6101C37.6215 26.7699 37.7525 27.0263 37.7525 27.2992V33.6046C37.7525 33.8775 37.6215 34.1338 37.4002 34.2936L31.4489 38.5927C31.1518 38.8074 30.7506 38.8074 30.4535 38.5927L24.5022 34.2936C24.2809 34.1338 24.1499 33.8775 24.1499 33.6046V27.4253C24.1499 27.404 24.1507 27.3829 24.1522 27.362C24.1507 27.3412 24.1499 27.3202 24.1499 27.2992C24.1499 27.0263 24.2809 26.7699 24.5022 26.6101L30.4535 22.311ZM25.8499 28.9618V33.17L30.1012 36.2411V32.0329L25.8499 28.9618ZM31.8012 32.0329V36.2411L36.0525 33.17V28.9618L31.8012 32.0329ZM35.451 27.2992L30.9512 30.5497L26.4515 27.2992L30.9512 24.0486L35.451 27.2992Z" fill="var(--c-svg-add)">
                        </path>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M24.4535 11.311C24.7506 11.0964 25.1518 11.0964 25.4489 11.311L31.4002 15.6101C31.6215 15.7699 31.7525 16.0263 31.7525 16.2992V22.6046C31.7525 22.8775 31.6215 23.1338 31.4002 23.2936L25.4489 27.5927C25.1518 27.8074 24.7506 27.8074 24.4535 27.5927L18.5022 23.2936C18.2809 23.1338 18.1499 22.8775 18.1499 22.6046V16.4253C18.1499 16.404 18.1507 16.3829 18.1522 16.362C18.1507 16.3412 18.1499 16.3202 18.1499 16.2992C18.1499 16.0263 18.2809 15.7699 18.5022 15.6101L24.4535 11.311ZM19.8499 17.9618V22.17L24.1012 25.2411V21.0329L19.8499 17.9618ZM25.8012 21.0329V25.2411L30.0525 22.17V17.9618L25.8012 21.0329ZM29.4509 16.2992L24.9512 19.5497L20.4515 16.2992L24.9512 13.0486L29.4509 16.2992Z" fill="var(--c-svg-add)">
                        </path>
                      </svg>
                    </span>
                    <div class="d-flex fd-col ml-10">
                      <span class="txt-micro c-txt-quiet">Blocks</span>
                      <span class="dashboard-main__general__hoverable mt-5 txt-data">
                        <span class="value-wrapper d-iflex ai-center">
                          <span class="">
                            <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.getBlocks()%></span>
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
                  </a>
                  <a href="Blocks.jsp" class="dashboard-main__general__item hover-pointer c-txt-accent ">
                    <span class="dashboard-main__general__item__icon">
                      <svg width="50" height="50" viewBox="0 0 50 51" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M50 25C50 38.8071 38.8071 50 25 50C11.1929 50 0 38.8071 0 25C0 11.1929 11.1929 0 25 0C38.8071 0 50 11.1929 50 25Z" fill="var(--c-svg-main)">
                        </path>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M20.5399 22.52C20.7683 22.52 20.9871 22.6119 21.1469 22.7751L28.4969 30.2751C28.8255 30.6104 28.8201 31.1485 28.4848 31.4771C28.1495 31.8057 27.6114 31.8002 27.2828 31.465L21.3898 25.4518L21.3898 34.37C21.3898 34.8395 21.0093 35.22 20.5398 35.22C20.0704 35.22 19.6898 34.8395 19.6898 34.37L19.6898 25.4518L13.7969 31.465C13.4683 31.8002 12.9302 31.8057 12.5949 31.4771C12.2596 31.1485 12.2542 30.6104 12.5828 30.2751L19.9328 22.7751C20.0926 22.6119 20.3114 22.52 20.5399 22.52Z" fill="var(--c-svg-add)">
                        </path>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M29.8699 13.89C30.3394 13.89 30.7199 14.2706 30.7199 14.74V23.6583L36.6129 17.6451C36.9414 17.3098 37.4796 17.3044 37.8149 17.6329C38.1502 17.9615 38.1556 18.4997 37.827 18.835L30.477 26.335C30.3171 26.4981 30.0983 26.59 29.8699 26.59C29.6415 26.59 29.4227 26.4981 29.2628 26.335L21.9128 18.835C21.5843 18.4997 21.5897 17.9615 21.925 17.6329C22.2603 17.3044 22.7984 17.3098 23.127 17.6451L29.0199 23.6583V14.74C29.0199 14.2706 29.4005 13.89 29.8699 13.89Z" fill="var(--c-svg-add)">
                        </path>
                      </svg>
                    </span>
                    <div class="d-flex fd-col ml-10">
                      <span class="txt-micro c-txt-quiet">Transactions</span>
                      <span class="dashboard-main__general__hoverable mt-5 txt-data">
                        <span class="value-wrapper d-iflex ai-center">
                          <span class="">
                            <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.getTransactions()%></span>
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
                  </a>
                  <a class="dashboard-main__general__item hover-pointer c-txt-accent ">
                    <span class="dashboard-main__general__item__icon">
                      <svg width="50" height="50" viewBox="0 0 51 51" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="25" cy="25" r="25" fill="var(--c-svg-main)">
                        </circle>
                        <path d="M24.5 17L32 24.35L24.5 31.7" stroke="var(--c-svg-add)" stroke-width="1.7" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round">
                        </path>
                        <path d="M32 24.35H19" stroke="var(--c-svg-add)" stroke-width="1.7" stroke-miterlimit="10" stroke-linecap="round">
                        </path>
                      </svg>
                    </span>
                    <div class="d-flex fd-col ml-10">
                      <span class="txt-micro c-txt-quiet">Outputs</span>
                      <span class="dashboard-main__general__hoverable mt-5 txt-data">
                        <span class="value-wrapper d-iflex ai-center">
                          <span class="">
                            <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.getOutputs()%></span>
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
                  </a>
                </div>
                <div class="dashboard-main__stats d-grid sm-order-0">
                  <div class="content-wrap b--def br-8 ">
                    <div class="content-wrap-body">
                      <div class="dashboard-stats__wrap">
                        <h3 class="dashboard-stats__title h6m">All time</h3>
                        <div class="dashboard-stats d-grid ">
                          <div class="">
                            <div class="dashboard-stats__item d-grid font-p fs-14 ">
                              <span class="txt-basic c-txt-quiet">
                                <span class="d-iblock va-mid">Blockchain size</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.getBlockChainSizeGB()%></span>
                                      <span class="ml-5">
                                      </span>
                                      <span style="word-break: keep-all;">GB</span>
                                    </span>
                                  </span>
                                </span>
                              </div>
                            </div>
                          </div>
                          <div class="">
                            <div class="dashboard-stats__item d-grid font-p fs-14 ">
                              <span class="txt-basic c-txt-quiet">
                                <span class="d-iblock va-mid">Block Median Time</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="``" class="wb-ba"><%=infos.getTime()%></span>
                                    </span>
                                  </span>
                                </span>
                              </div>
                            </div>
                          </div>
                          <div class="">
                            <div class="dashboard-stats__item d-grid font-p fs-14 ">
                              <span class="txt-basic c-txt-quiet">
                                <span class="d-iblock va-mid">Latest block</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <a href="Blocks.jsp" class="inline-link--highlited">
                                        <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="``" class="wb-ba"><%=infos.getLastestBlock()%></span>
                                      </a>
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
                                <span class="d-iblock va-mid">Difficulty</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.getDifficulty()%></span>
                                    </span>
                                    <span class="ai-center d-none">
                                      <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                        <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                        </path>
                                      </svg>
                                      <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                                    </span>
                                    <a href="bitcoin/charts/difficulty" class="dashboard-stats__item__graph ml-5 hover-pointer">
                                      <svg width="18" height="16" viewBox="0 0 18 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g opacity="0.4">
                                          <path d="M17.5938 1.22514C17.3255 0.956216 16.8909 0.955507 16.6218 1.2233L11.4036 6.42042L9.89552 4.91238C9.62703 4.64413 9.19226 4.64388 8.92377 4.91238L2.80733 11.0288C2.53883 11.2971 2.53883 11.7324 2.80733 12.0006C2.94135 12.1348 3.11729 12.202 3.29323 12.202C3.46892 12.202 3.6451 12.1348 3.77909 12.0006L9.40966 6.37028L10.9168 7.87715C11.185 8.1454 11.6187 8.14565 11.8876 7.87828L17.5917 2.19711C17.8606 1.92932 17.8616 1.49406 17.5938 1.22514Z" fill="url(#gl_ui-value0)">
                                          </path>
                                          <path d="M16.3552 13.75H1.28951V0.625001C1.28951 0.279791 1.00088 0 0.644755 0C0.288634 0 0 0.279791 0 0.625001V14.375C0 14.7202 0.288634 15 0.644755 15H16.3552C16.7114 15 17 14.7202 17 14.375C17 14.0298 16.7114 13.75 16.3552 13.75Z" fill="url(#gl_ui-value1)">
                                          </path>
                                        </g>
                                      </svg>
                                    </a>
                                  </span>
                                </span>
                              </div>
                            </div>
                          </div>
                          <div class="">
                            <div class="dashboard-stats__item d-grid font-p fs-14 ">
                              <span class="txt-basic c-txt-quiet">
                                <span class="d-iblock va-mid">Update</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba">Taproot</span>
                                    </span>
                                    <span class="ai-center d-none">
                                      <svg class="ml-10" width="9" height="6" viewBox="0 0 9 6" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(180deg);">
                                        <path d="M1.1837 4.99987L4.71924 1.46433L8.25477 4.99987" stroke="var(--c-red-h)">
                                        </path>
                                      </svg>
                                      <span class="ml-5 font-h medium fs-14 ls-5 lh-100" style="color: var(--c-red-h);">0%</span>
                                    </span>
                                    <a href="bitcoin/charts/difficulty" class="dashboard-stats__item__graph ml-5 hover-pointer">
                                      <svg width="18" height="16" viewBox="0 0 18 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g opacity="0.4">
                                          <path d="M17.5938 1.22514C17.3255 0.956216 16.8909 0.955507 16.6218 1.2233L11.4036 6.42042L9.89552 4.91238C9.62703 4.64413 9.19226 4.64388 8.92377 4.91238L2.80733 11.0288C2.53883 11.2971 2.53883 11.7324 2.80733 12.0006C2.94135 12.1348 3.11729 12.202 3.29323 12.202C3.46892 12.202 3.6451 12.1348 3.77909 12.0006L9.40966 6.37028L10.9168 7.87715C11.185 8.1454 11.6187 8.14565 11.8876 7.87828L17.5917 2.19711C17.8606 1.92932 17.8616 1.49406 17.5938 1.22514Z" fill="url(#gl_ui-value0)">
                                          </path>
                                          <path d="M16.3552 13.75H1.28951V0.625001C1.28951 0.279791 1.00088 0 0.644755 0C0.288634 0 0 0.279791 0 0.625001V14.375C0 14.7202 0.288634 15 0.644755 15H16.3552C16.7114 15 17 14.7202 17 14.375C17 14.0298 16.7114 13.75 16.3552 13.75Z" fill="url(#gl_ui-value1)">
                                          </path>
                                        </g>
                                      </svg>
                                    </a>
                                  </span>
                                </span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="content-wrap b--def br-8 ">
                    <div class="content-wrap-body">
                      <div class="dashboard-stats__wrap">
                        <h3 class="dashboard-stats__title h6m">Mempool</h3>
                        <div class="dashboard-stats d-grid ">
                          <div class="">
                            <div class="dashboard-stats__item d-grid font-p fs-14 ">
                              <span class="txt-basic c-txt-quiet">
                                <span class="d-iblock va-mid">Transactions</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="``" class="wb-ba"><%=infos.getMemPoolCount()%></span>
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
                                <span class="d-iblock va-mid">Transactions per second</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.getTpS()%></span>
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
                                <span class="d-iblock va-mid">Fees</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.getMemFees()%></span>
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
                                <span class="d-iblock va-mid">Size</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.getMemPoolSizeMB()%></span>
                                      <span class="ml-5">
                                      </span>
                                      <span style="word-break: keep-all;">MB</span>
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
                                <span class="d-iblock va-mid">Average transaction fee</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.getAverageFee()%></span>
                                      <span class="ml-5">
                                      </span>
                                      <span style="word-break: keep-all;">satoshi per byte</span>
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
                  </div>
                </div>
                <div class="dashboard-main__stats d-grid">
                  <div class="content-wrap b--def br-8 grid-span-2">
                    <div class="content-wrap-body">
                      <div class="dashboard-stats__wrap">
                        <h3 class="dashboard-stats__title h6m">24h statistics</h3>
                        <div class="dashboard-stats d-grid grid-1-1">
                          <div class="">
                            <div class="dashboard-stats__item d-grid font-p fs-14 ">
                              <span class="txt-basic c-txt-quiet">
                                <span class="d-iblock va-mid">Transactions</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <a href="Blocks.jsp" class="inline-link--highlited">
                                        <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="``" class="wb-ba"><%=infos.get24HTransactions()%></span>
                                      </a>
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
                                <span class="d-iblock va-mid">Blocks</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <a href="Blocks.jsp" class="inline-link--highlited">
                                        <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="``" class="wb-ba"><%=infos.get24HBlocks()%></span>
                                      </a>
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
                                <span class="d-iblock va-mid">Outputs</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.get24HOutputs()%></span>
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
                                <span class="d-iblock va-mid">Transactions per second</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.get24HTpS()%></span>
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
                                <span class="d-iblock va-mid">Avg. time between blocks</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.get24HTpB()%></span>
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
                                <span class="d-iblock va-mid">Volume</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.get24HVolume()%></span>
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
                                <span class="d-iblock va-mid">Hashrate</span>
                              </span>
                              <div class="dashboard-stats__item">
                                <span class="txt-data c-txt-main">
                                  <span class="value-wrapper d-iflex ai-center">
                                    <span class="">
                                      <span v-update:raw="value !== defaultValue ? value : undefined " v-mount:raw="value !== defaultValue ? value : undefined " v-tooltip="''" class="wb-ba"><%=infos.getHashpS()%></span>
                                      <span class="ml-5">
                                      </span>
                                      <span style="word-break: keep-all;">Eh/s</span>
                                      <span class="regular c-txt-quiet ml-5">(SHA-256)</span>
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
                  </div>
                </div>
              </main>
            </div>
          </div>
          <div class="dashboard-bottom-wrap" style="padding-bottom: 100px;">
            <div class="container-1280 dashboard-bottom">
              <div class="dashboard-tables d-grid">
                <div class="btable-wrap of-hidden">
                  <h3 class="h6m c-txt-main d-iblock mb-15">Latest blocks</h3>
                  <div class="br-8 b--def bgc-plain-bright pb-10">
                    <div class="btable-table-wrap maxh-none">
                      <table class="btable-table w-100">
                        <thead class="">
                          <tr>
                            <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Height</th>
                            <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Hash</th>
                            <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Mined on</th>
                            <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Output total</th>
                          </tr>
                        </thead>
                        <tbody class="bgc-white">
                        <%
                		Connection con=null;
                		Statement stmt=null;
                		ResultSet rs=null;
                		Class.forName("com.mysql.jdbc.Driver");
                		String url="jdbc:mysql://localhost:3306/blockchain?useUnicode=true&characterEncoding=gbk";
                		con=DriverManager.getConnection(url,"root","root");
                		stmt=con.createStatement();
                		String sql="select height,block.`hash`,from_unixtime(time) time,round(ifnull(sum(vout.`value`),0),2) output from block,tx,vout where (block.`hash`=tx.blockhash)and(tx.txid=vout.ftxid) group by block.`hash` order by height desc limit 10";
                		rs=stmt.executeQuery(sql);
                		DecimalFormat heightf=new DecimalFormat("#,##0");
                		DecimalFormat outf=new DecimalFormat("#,##0.00");
                		while(rs.next()){ %>
                          <tr data-href="/bitcoin/block/716465">
                            <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                              <span class="value-wrapper d-iflex ai-center null">
                                <span class="rtl-preserve">
                                  <span class="wb-ba"><%=heightf.format(Integer.valueOf(rs.getString(1)))%></span>
                                </span>
                              </span>
                            </td>
                            <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                              <span class="value-wrapper d-iflex ai-center null">
                                <span class="">
                                  <a href="Block.jsp?hash=<%=rs.getString(2)%>" class="medium inline-link--highlited v-tooltip-placement-top-left" tooltip-placement="top-left" target="_self" tabindex="-1" style="--v-tooltip-left:0%; --v-tooltip-right:auto; --v-tooltip-top:0%; --v-tooltip-translate:translate(0%, -100%); --v-tooltip-arrow-border-top-color:var(--v-tooltip-background-color); --v-tooltip-arrow-top:calc(var(--v-tooltip-top) - var(--v-tooltip-top-offset) + 10px); --v-tooltip-arrow-left:calc(var(--v-tooltip-left) + 16px);">
                                    <span class="wb-ba"><%="..."+rs.getString(2).substring(48,64)%></span>
                                  </a>
                                </span>
                              </span>
                            </td>
                            <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                              <span class="value-wrapper d-iflex ai-center null">
                                <span class="rtl-preserve">
                                  <span class="wb-ba"><%=rs.getString(3)%></span>
                                </span>
                              </span>
                            </td>
                            <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                              <span class="value-wrapper d-iflex ai-center null">
                                <span class="rtl-preserve">
                                  <span class="wb-ba"><%=outf.format(Double.valueOf(rs.getString(4)))%></span>
                                  <span style="margin-left: 5px; word-break: keep-all;">BTC</span>
                                </span>
                              </span>
                            </td>
                          </tr>
                          <%}
					rs.close();
					%>
                        </tbody>
                      </table>
                    </div>
                    <a href="Blocks.jsp" class="btable-button hover-pointer button primary p-relative d-iblock ml-10 " style="">Explore blocks</a>
                  </div>
                </div>
                <div class="btable-wrap of-hidden">
                  <h3 class="h6m c-txt-main d-iblock mb-15">The biggest transactions</h3>
                  <span class="font-p regular fs-14 lh-100 ls-2 c-txt-quiet ml-5">24 hours</span>
                  <div class="br-8 b--def bgc-plain-bright pb-10">
                    <div class="btable-table-wrap maxh-none">
                      <table class="btable-table w-100">
                        <thead class="">
                          <tr>
                            <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Hash</th>
                            <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Output</th>
                            <th class="font-p regular fs-13 lh-100 ls-2 c-txt-quiet ta-left">Time</th>
                          </tr>
                        </thead>
                        <tbody class="bgc-white">
                        <%
						sql="select tx.`hash`,round(ifnull(sum(vout.`value`),0),2) output,from_unixtime(time) time,txid from block,tx,vout where (block.`hash`=tx.blockhash)and(tx.txid=vout.ftxid)and((from_unixtime(time))>=(NOW() - interval 24 hour)) group by tx.txid order by sum(vout.`value`) desc limit 10";
						rs=stmt.executeQuery(sql);
						while(rs.next()){%>
                          <tr>
                            <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                              <span class="value-wrapper d-iflex ai-center null">
                                <span class="rtl-preserve">
                                    <span class="wb-ba"><%=rs.getString(1).substring(0,16)+"..."%></span>
                                </span>
                              </span>
                            </td>
                            <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                              <span class="value-wrapper d-iflex ai-center null">
                                <span class="rtl-preserve">
                                  <span class="wb-ba"><%=outf.format(Double.valueOf(rs.getString(2)))%></span>
                                  <span style="margin-left: 5px; word-break: keep-all;">BTC</span>
                                </span>
                              </span>
                            </td>
                            <td class="font-p regular fs-13 lh-auto ls-2 ta-left">
                              <span class="value-wrapper d-iflex ai-center null">
                                <span class="rtl-preserve">
                                  <span class="wb-ba"><%=rs.getString(3)%></span>
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
                    <a class="btable-button hover-pointer button primary p-relative d-iblock ml-10 " style="">Explore transactions</a>
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