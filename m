Return-Path: <linux-watchdog+bounces-4868-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ1sO8WXgGnL/gIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4868-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Feb 2026 13:25:41 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E05CC550
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Feb 2026 13:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0F0A302BB88
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Feb 2026 12:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90836364E81;
	Mon,  2 Feb 2026 12:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bl+Cx+EW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpFBcRrL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EA2365A05
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Feb 2026 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035009; cv=none; b=jxejnghaWvtC7EnsK6zf6QP17WNy06som290LQBSOjdCXuk0QCx9Ie6mOaKYtjPgmNM+W/U50+GlLIU0fLmZKoJDPYpMpwSBOUwxcNoOPLf1YS3SNqcpDxzLIvJ+SwB8Vo4o07dE5m1buho42Kz4LnNW7L1DO886E7fwQjy2Uf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035009; c=relaxed/simple;
	bh=+DKcwC7NTyCA/gl/ZDQxs8wO8JKKEH25qMtNu7FO14w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baUooY/nT6XuEGgd6TsF+tymkbErCJg4fAwnN2RJHABKyvSpPOnxtw38lBwrjT6TYsHzyGbMNHno7m9uinUcCRmUaBU2JQ6KNAhKwuwspB3m69+kENpL9VQ0vWuFFbrrMqwK5eWtAgQ//sVXHc5KGxbk6WQKmVXyf+uVC8w47NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bl+Cx+EW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpFBcRrL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B0M9n2899904
	for <linux-watchdog@vger.kernel.org>; Mon, 2 Feb 2026 12:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r0UJBOOi/kAh4rFVu3QvP+gG227MJiiG8UbKLGyofKI=; b=bl+Cx+EW0tTwB0Ky
	TN4KbkMMUBLdNfUxhSlRcTV/+Qnxpb5LcZ7ozrdhUuKtDcrQGgN9n8srBhg12TcT
	fn9uYlhsCo/gFBiYKWPhF7cZsXwDfCs4IfYFeQmQwdf5tTxueIbNxSbcbx6iTY7I
	FZkhCTEcSnV6WW2mDfc2ZpCLSpCbj/4vtBjVrinhkO97W3Wp3c0k/2ict3YRU9D7
	OyhQugSlwJr/xj6AZ/X+hMw3ZhFMCnMJLzvM1uFlyKiXEgu+TpoBTxtKB2yys+WZ
	7tLpiezSHP11+v4i47PZcJynj6cHIKXXgl+hIEOIdZVpzrKWVoOwuqygeGWR46eP
	/AHkDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0r73n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 02 Feb 2026 12:23:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cb31bcdso94406685a.1
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Feb 2026 04:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770035006; x=1770639806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0UJBOOi/kAh4rFVu3QvP+gG227MJiiG8UbKLGyofKI=;
        b=OpFBcRrLBm5XgX2PKzmVaLxWC2Fee1K9c1X6ppE7Enc66oqWBcoR99/mdJsyvCOYoe
         hcyfmhD0DJrlixJkY2+heh3cruoZ2/pSL7IpkRLM1BncE1xYQp58dZu0yEBvqix/wqyy
         DM9JFxEE5uYudT+M3dveLhCm/rUu7Ct/+dHwzmHFhJvqjLGmmX37kAIKnFGp33nWUoZF
         2MA+ZfI1grZvwHh/2xpitAty5TIqlhQZpMxrvblAqUFNsMnDousKT3XWOQ26j92oeu4y
         EqxqN7df2a55XdnEYpRVu+uNzp4g1xhXd/fp+T9YHta/+6AfFKCOpFyQHA/My8UiSVFi
         6MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035006; x=1770639806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0UJBOOi/kAh4rFVu3QvP+gG227MJiiG8UbKLGyofKI=;
        b=p1krBjHMVYBdcf/tir5Ib5J9S/Xds47SY+huDGIBBBKhZkL0C4yQ9I6fmRRh3mOck3
         4oWnUIXez7+FUwR/Gy/7PoD73q9mswsMXctaLElAwAkR1TkRhVUsG2fy2hyv7QfjDfVO
         MfhEKPTpTEoZ4A621scsa9eMy4Ah7CngmLnSOz0em25Ve58y5/iANeYmEG/UPT4SAAR6
         9Q/A9gRBvSrgHRr7HE2lQwlFzYqE+dukGOAydx5HOnmra7UHIOW8UedVL9SrjVg1VLmw
         e/bIlUPVnvB+cpXDiPzKyvmOBWoJJ48lxdBKBrhuwbqORmehwhfDg6PXT+ddezP/iIyc
         HPAg==
X-Forwarded-Encrypted: i=1; AJvYcCUi5MNCCu2+T0sxE0xMJFqsyD0KLTDohTPo6C4sOIxvNzAWS1H2fIuU3wwul3KPYgVSHCRRkE034B9cpprzPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zL12/2tIQdY+iTASIfxvcVPnohilee5Ht10ZFOz2loZg1zqa
	34E9zG7wOFlDlMbNVmkELlC0036iBjKfK1PFJeQ/UP75SoDoXchcaHyaxMcLI9B4KGPTk5pxr4j
	TTgs2UR1LlFQ3zd5+qWzXmRgCvJe0kxNavJ7Hs6Js70Xj3IyLPXux16UMBIdDhAYPDwh4OQ==
X-Gm-Gg: AZuq6aIf5yU5/RjBXj/uO5sCKb4Fb50FmwLhJAqjXyMg6K2ZVgnD5KdRU0+aQSgzmiA
	RmQXK+8tsIqDmMNUsSC4rvmlvPVoX6x4LKSq7YxuJNj8rk6g5g4lSyIIg49NcU7I7XYi4qsiKKD
	U2FXff8HDTYhWHWJEBC+PMYLRPtGLw4b8GI/fHDOQ8U43ddvODJOYDpdSZXh1sAShHIxUUtkE4v
	gOfHMaWmgkv4i4FdNHBw8vGBHoN8sDVE92wdwCI62kmjPh/vvoXV62sqstM/k3ClLGoxcDjOxde
	KYODyGsI19exTMMdLDo3ID1JRB/snGm2xOif4DYvE1Lh0xI/BDMvxgJIILc+kc2wngh5nWNZHQq
	QA4OYIBG5KheCVkGl0M6nQWmWlgsrFzWxBJ9kopDJg4Wl0+096OcomiIpNhz3FmAmdBE=
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1206559185a.1.1770035006181;
        Mon, 02 Feb 2026 04:23:26 -0800 (PST)
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1206554785a.1.1770035005433;
        Mon, 02 Feb 2026 04:23:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a92sm7779349a12.5.2026.02.02.04.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:23:23 -0800 (PST)
Message-ID: <2a19de94-8a5a-4fd1-b15a-9b76ea5076d9@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 13:23:20 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WIlQkcj26iSiGrvKp9uLMaZ9EmcqL3mC
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6980973e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=o4o9nyK-Q1O9M6IKefoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5NiBTYWx0ZWRfXxKxRcJ4NI+f8
 KrRbyMTgBp1Jkvrlyi43OLn7LcPpJ/yV3ghmUPATuDJAsni4ezJq2kd/TXsk5hLTqmS3vS6dFXE
 kgjsNU47ZUDqUuQtuZp1CnFg5RcMysDRZEobe2M/iufUckNjD9qIFIgL7r6L2HduUMvIgy791OE
 paUlJzt5ZnBRRzYU1HPFcjQ67orJVr0AJxkmCMu74qA+l8SH3Qjt4zZ/WT6Ty4YBPOuW/r7sGYc
 1vsFE3h451+6e9d05s4OmyWp6dHD+xIKSEPu9iHBvDFU3CFk/Nwqp+hETSYNrzCRGe4dat/BDLJ
 QoN5O9AUmBvL5ld4+obpxU6DwL3B/ONcTLUOpEkFlSQoCmirY/u4By1rj325aIsjGhlfDM5mGf+
 HUCrdOHgW6zsn2uUDsMn4bEageoOYR8Ivu0/3URnl22H/inVxMHJRTlJMHVhkl2VIXnOPAcKZ3F
 MyBeKxkNyQ3xFgITJsg==
X-Proofpoint-GUID: WIlQkcj26iSiGrvKp9uLMaZ9EmcqL3mC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4868-lists,linux-watchdog=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.131.57.192:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,7d000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52E05CC550
X-Rspamd-Action: no action

On 1/30/26 11:44 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 112KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v6:
> 	- move to mmio-sram and drop the Konrad's R-b tag
> Changes in v5:
> 	- No changes
> Changes in v4:
> 	- No changes
> Changes in v3:
> 	- Picked up the R-b tag
> Changes in v2:
> 	- Describe the entire IMEM region in the node
> 	- Explicitly call out that initial 4K only accessible by all
> 	  masters in the commit message
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index eb393f3fd728f0b2fc8cd93c849f8c170d76e312..90790f99f0597b63801d4e07b9b72cd372ad46d4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -697,6 +697,15 @@ ssphy_0: phy@7d000 {
>  			status = "disabled";
>  		};
>  
> +		sram@8600000 {
> +			compatible = "qcom,ipq5424-imem", "mmio-sram";
> +			reg = <0 0x08600000 0 0x1c000>;
> +			ranges = <0 0 0x08600000 0x1c000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;

I think you may need to add 'no-memory-wc' too, in case someone uses
any of the sram functions on this in the future

Konrad

