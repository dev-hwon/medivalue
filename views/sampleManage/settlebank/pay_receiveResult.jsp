<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>S'Pay 결제 결과 페이지</title>
<style type="text/css">
    body            {font-family:굴림; font-size:10pt; color:#000000; text-decoration:none;}
    font            {font-family:굴림; font-size:10pt; color:#000000; text-decoration:none;}
    td              {font-family:굴림; font-size:10pt; color:#000000; text-decoration:none; padding:3px; border:1px solid #e1e1e1;}
    .left           {padding-left:5px; width:100px;}
    .right          {padding-left:5px;}
    .wrapper        {max-width:700px;border:1px solid #e1e1e1;}
    .tab            {background-color:#f1f1f1;padding:10px 20px;border:1px solid #e1e1e1; font-weight: bold; font-size:1.1em;}
    table           {width:100%; border-collapse:collapse;}
    .button         {padding:5px 20px; border-radius:20px; border:1px solid #ccc; width:70%; margin:5px 0px; transition:0.3s; cursor:pointer;}
    .button:hover   {background-color:#aaaaaa;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//결제 결과 세팅
var _PAY_RESULT = {
        mchtId :        "${RES_PARAMS.mchtId}",
        outStatCd :     "${RES_PARAMS.outStatCd}",
        outRsltCd :     "${RES_PARAMS.outRsltCd}",
        outRsltMsg :    "${RES_PARAMS.outRsltMsg}",
        method :        "${RES_PARAMS.method}",
        mchtTrdNo :     "${RES_PARAMS.mchtTrdNo}",
        mchtCustId :    "${RES_PARAMS.mchtCustId}",
        trdNo :         "${RES_PARAMS.trdNo}",
        trdAmt :        "${RES_PARAMS.trdAmt}",
        mchtParam :     "${RES_PARAMS.mchtParam}",
        authDt :        "${RES_PARAMS.authDt}",
        authNo :        "${RES_PARAMS.authNo}",
        reqIssueDt :  	"${RES_PARAMS.reqIssueDt}",
        intMon :        "${RES_PARAMS.intMon}",
        fnNm :          "${RES_PARAMS.fnNm}",
        fnCd :          "${RES_PARAMS.fnCd}",
        pointTrdNo :    "${RES_PARAMS.pointTrdNo}",
        pointTrdAmt :   "${RES_PARAMS.pointTrdAmt}", 
        cardTrdAmt :    "${RES_PARAMS.cardTrdAmt}",
        vtlAcntNo :     "${RES_PARAMS.vtlAcntNo}",
        expireDt :      "${RES_PARAMS.expireDt}",
        cphoneNo :      "${RES_PARAMS.cphoneNo}",
        billKey :       "${RES_PARAMS.billKey}"

//main으로 결과 전달
function sendResult()
{
    if(top.opener){
        //팝업창
        top.opener.rstparamSet(_PAY_RESULT);
        top.opener.goResult();
        self.close();
    }
    else{//iframe
        parent.postMessage(_PAY_RESULT, "*");
    }
}
</script>
</head>
<body>
<h2>승인 요청 결과</h2>
<div class="wrapper">
    <div class="tab">응답 파라미터</div>
    <table>
        <tr>
            <td class="left">mchtId</td>
            <td class="right"><%= RES_PARAMS.get("mchtId") %></td>
        </tr>
        <tr>
            <td class="left">outStatCd</td>
            <td class="right"><%= RES_PARAMS.get("outStatCd") %></td>
        </tr>
        <tr>
            <td class="left">outRsltCd</td>
            <td class="right"><%= RES_PARAMS.get("outRsltCd") %></td>
        </tr>
        <tr>
            <td class="left">outRsltMsg</td>
            <td class="right"><%= RES_PARAMS.get("outRsltMsg") %></td>
        </tr>
        <tr>
            <td class="left">method</td>
            <td class="right"><%= RES_PARAMS.get("method") %></td>
        </tr>
        <tr>
            <td class="left">mchtTrdNo</td>
            <td class="right"><%= RES_PARAMS.get("mchtTrdNo") %></td>
        </tr>
        <tr>
            <td class="left">mchtCustId</td>
            <td class="right"><%= RES_PARAMS.get("mchtCustId") %></td>
        </tr>
        <tr>
            <td class="left">trdNo</td>
            <td class="right"><%= RES_PARAMS.get("trdNo") %></td>
        </tr>
        <tr>
            <td class="left">trdAmt</td>
            <td class="right"><%= RES_PARAMS.get("trdAmt") %></td>
        </tr>
        <tr>
            <td class="left">mchtParam</td>
            <td class="right"><%= RES_PARAMS.get("mchtParam") %></td>
        </tr>
        <tr>
            <td class="left">authDt</td>
            <td class="right"><%= RES_PARAMS.get("authDt") %></td>
        </tr>
        <tr>
            <td class="left">authNo</td>
            <td class="right"><%= RES_PARAMS.get("authNo") %></td>
        </tr>
        <tr>
            <td class="left">reqIssueDt</td>
            <td class="right"><%= RES_PARAMS.get("reqIssueDt") %></td>
        </tr>
        <tr>
            <td class="left">intMon</td>
            <td class="right"><%= RES_PARAMS.get("intMon") %></td>
        </tr>
        <tr>
            <td class="left">fnNm</td>
            <td class="right"><%= RES_PARAMS.get("fnNm") %></td>
        </tr>
        <tr>
            <td class="left">fnCd</td>
            <td class="right"><%= RES_PARAMS.get("fnCd") %></td>
        </tr>
        <tr>
            <td class="left">pointTrdNo</td>
            <td class="right"><%= RES_PARAMS.get("pointTrdNo") %></td>
        </tr>
        <tr>
            <td class="left">pointTrdAmt</td>
            <td class="right"><%= RES_PARAMS.get("pointTrdAmt") %></td>
        </tr>
        <tr>
            <td class="left">cardTrdAmt</td>
            <td class="right"><%= RES_PARAMS.get("cardTrdAmt") %></td>
        </tr>
        <tr>
            <td class="left">vtlAcntNo</td>
            <td class="right"><%= RES_PARAMS.get("vtlAcntNo") %></td>
        </tr>
        <tr>
            <td class="left">expireDt</td>
            <td class="right"><%= RES_PARAMS.get("expireDt") %></td>
        </tr>
        <tr>
            <td class="left">cphoneNo</td>
            <td class="right"><%= RES_PARAMS.get("cphoneNo") %></td>
        </tr>
        <tr>
            <td class="left">billKey</td>
            <td class="right"><%= RES_PARAMS.get("billKey") %></td>
        </tr>

        <tr>
            <td colspan="2" style="text-align: center;">
                <input class="button" type="button" value="확인" onclick="sendResult()" /> 
            </td>
        </tr>
    </table>
</div>
</body>
</html>