Return-Path: <linux-watchdog+bounces-4871-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN7pNDGqgGkFAQMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4871-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Feb 2026 14:44:17 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29FCCE59
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Feb 2026 14:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BD3E3028347
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Feb 2026 13:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10024369997;
	Mon,  2 Feb 2026 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8JOq4y1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZppOAXZh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994A3369965
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Feb 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039854; cv=none; b=q3u1J+EM4UhhlfnDPu8PXmi7Y7rZK5JOcIdLShYWHEjL+naKy2MnewYEjfOUuzklQGuOpRi6U2hXu73u9aDw97IOOJ9LlaFDsYgUunfjOS8wdvvPCkQpG8wRYA0/mPk8HuzYaS/U2WN0m0PIyvoAhxZTyc4GYo9/Gl6vz/Uzv9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039854; c=relaxed/simple;
	bh=TXrVzglhxx2R/ILCLbECZUnzA+BqufE9jF3+1Fhl2jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csLreJuO47fkP5KdgaWegxH5P6VuYc/N2H8z2au5HbL2w5lVx1G0HhHfO0IP27qwMf80Ws0Q4MAzBTimfDLabbyCt7GTcksb3AWmKcDCnWd/yoOunFvfPfDocwt4OY67Qr9nRKQgxrH3/D3UFA1N6q5+WtgoODiLBtDRLq0wn5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8JOq4y1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZppOAXZh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B0fBX2900255
	for <linux-watchdog@vger.kernel.org>; Mon, 2 Feb 2026 13:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ag58kKX5ANor8LMMtVZGiTM/
	y6XE2+FFqs7vu7KEdRA=; b=F8JOq4y10tPYDBunwHtDfPAE14oWoY+JlEQJK/C1
	Frd/wv4rskjAzI/jWOCgXOVxSm2Tsv26Q7KTJ/AWZgduvUGCS/E9QSodJ0cqqf5l
	HRLk4y9VE2kg6tMDSjQsLMg0lYw11bsIL4mQKsMGCRxc+trsfo+LdD4KmJhUMH9V
	hNDfLNaMYRlk7A44EUrRxCzbYHh/8qxoGDDoUQqW+RCiFbHpFn1Eyb5mccGBdWum
	dir50GAL8ePsG98LlYeUhxWARDz2Qdljh1I6DJJPfJjvzTr2d1pMgNqxxEOmcFr4
	vBNkucK9zpSzbhDOP2/wxN/qNh083KToMXeYkzhWFeEBCA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0re1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 02 Feb 2026 13:44:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f3f3af760so9068732b3a.1
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Feb 2026 05:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770039851; x=1770644651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag58kKX5ANor8LMMtVZGiTM/y6XE2+FFqs7vu7KEdRA=;
        b=ZppOAXZhM3FOk3ccVfZSyjDk3SKa7SipCI4wXrB+NE9MaOn6Npyq0UcvgxmpfloJqz
         1kPHWZDJ+4sSnEUc10q9wTKTUj2JVBucDDDfIIzIRJsl+qGqXJ/cBVkuabK3qv5pHgwl
         t/yE0YAkkfJC41UGlC6BW2neF4K1LQt3FSO7mVl78Oftx8CSuHNJb7B6U9WNyawSnjQY
         /VXlWztpTaUxiBLKoNExdKBiJoyH8zniOUjeIyd6q6bxJwJ2jyterFuCF+3FJ2JfIw06
         UYIsjSEHlOL+zM9OQyTuMByyn4PWZr9HT55PoHEqlkOZQFy7Edgvd2dEIRFErO5AUqRS
         mfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770039851; x=1770644651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ag58kKX5ANor8LMMtVZGiTM/y6XE2+FFqs7vu7KEdRA=;
        b=OY6aYEESLpOE5RHZz38J9t/rHvYgcQJ7yhQd7lZrX+L/ermlSnE6EqhGKCcFw+FB4b
         +YWGLYc62PDLa2weG7Vvs7rvrAVZya9V5Yd/lFyPNqGfXtJhAbERamkb+RC1xMlllVI9
         5+qTt76elE/i9zYBQcAA0c7zPmJ6eNGa1+fhB1zgVYJyuC57oz0SenoQ2RUT1pN1+p0c
         tfAbChIuuo42A7fyZUlu3rmu/zsBf64awoVpa6vECZ4geMY7PTYKl2F2kCfa02xS7w2x
         5Yr7VTfMSqY4zLQIX1MAWHboTsypaRGn/EuLBTReyvJRKbgtq5l0ikEdaHgcPdpDzWNg
         AqPg==
X-Forwarded-Encrypted: i=1; AJvYcCWcGsgM/0FoKZwzIVqiS4//xrLToIsXnKT/vFCJJ8R/j7LS+NMsyCViEcxWY+++z43G4he7tQK4+ot8k64aYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNtbgqw6pkz6NoaMF1b/HsOcVbtFBa8UnKQNEdjplNV0wHlPkU
	ozZnkC9I6Ed0LXiYwpozjhlLqyXK1DhQyWbWxRs30MWPkdq4+35N/KOb8aUDg0T2Rf0/inWY1iF
	4jtcJAoWzTDsObnj7tgTOrkAamnUUrTPeEl7On4rioOp+Nimvd2WfSf2+/KUvPLRko0w6MA==
X-Gm-Gg: AZuq6aL+ZI86tKBkcQgsnSMwtyX9SbEYAvv4/KqzbqnrPf265g994MOmKgcVOIhdidq
	RDZILcprzojM4XE4GjgE5Jqzkmww4E+2TM7LHAd4yVfWpRjYIQOZgSTw1phDuG32ka2cfJR53Hr
	qA6XDjInPlF/n7hB/zUrGyad7XFfoIw+t9y1ZW3oq5V6d7/MJcBuS0FmxgB0vuUsJkKISjTP81B
	gFWRr1VjA26jiaEcyvHYXbLOqntjl1L5FxkrBVy1cKIY6W5k6HoqeUjyGbOhL5Rg4ZH6lmP3c/o
	O5kwi3OnXdeJI+K7BkTo2MNXd+3wCpVR31ZloiJtJYeB+nW7sJlbYlnU6YL7wvbdq4POfnKA4h6
	8mQyEo0mUzd2yC9Ew0gzrP/RTQAcMWHljNnwr
X-Received: by 2002:a05:6a00:39a9:b0:81f:994f:cb with SMTP id d2e1a72fcca58-823ab67b8a1mr10943009b3a.24.1770039850328;
        Mon, 02 Feb 2026 05:44:10 -0800 (PST)
X-Received: by 2002:a05:6a00:39a9:b0:81f:994f:cb with SMTP id d2e1a72fcca58-823ab67b8a1mr10942982b3a.24.1770039849639;
        Mon, 02 Feb 2026 05:44:09 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfd797sm15752992b3a.43.2026.02.02.05.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:44:09 -0800 (PST)
Date: Mon, 2 Feb 2026 19:14:02 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Message-ID: <20260202134402.ochfxv3lnju3dioa@hu-mojha-hyd.qualcomm.com>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-5-417ab789cd97@oss.qualcomm.com>
 <5zqxloovexknbuhknbafc2trf66d6zwtvtkhjbchmbndxg2j6u@3giwqjkd2vl7>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5zqxloovexknbuhknbafc2trf66d6zwtvtkhjbchmbndxg2j6u@3giwqjkd2vl7>
X-Proofpoint-ORIG-GUID: jNT4nQaVuvVfinvrCTXTv9wAh-dLhdoi
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6980aa2b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qiayP-4gCwJqfZe5UOMA:9
 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwNyBTYWx0ZWRfX5skj5Vbl/2Zy
 4Zs9fdEn45qljq+DHChyJxXcvnXRNk6sHQPwBTCJ29qaVQD/SeD78zdvb5/sHexdQtzsZM9lwGT
 9UgdOLi157kmZVpC7tOE1iJPgL3fIyyQcsQCwSAZ4OuSrnMa9077HYZMmpAswSl4D92ED+rqJXm
 kniTwYwz1hlWVAZeipzZ8maV912gT0z8h0k4xjY+k1JRMtGTTsUq8mVmu1VsSVLIGIyhz+K5cqV
 F+PMI3OVoPLPTuQcyaQnZz31FBDjh2R6rOlXdQjnJAxedtvSWnB1LMwLJCiPkSdcCFhG4N+Z4/z
 nIqj6cfdXA3Iva7JvcQBy6GwZsPVL6S3fZT7Lt+kCtGQCfKnX6IYGlsxUJPfPiUbB+/fmGUV6a8
 2/OPp8lqaQK0FBFU/qcVoF6ziSnwBwJCITsZt47kcE0vcJQhk/gpbWGofqHGxIj4nSXsezJUaBU
 dcoD/GF1qasUvvWxq1Q==
X-Proofpoint-GUID: jNT4nQaVuvVfinvrCTXTv9wAh-dLhdoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4871-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E29FCCE59
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 10:18:29AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 04:14:34PM +0530, Kathiravan Thirumoorthy wrote:
> > Add the "sram" property to the watchdog device node to enable
> > retrieval of the system restart reason from IMEM, populated by XBL.
> > Parse this information in the watchdog driver and update the bootstatus
> > sysFS if the restart was triggered by a watchdog timeout.
> > 
> > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > ---
> > Changes in v6:
> > 	- Update the 'sram' property to point to the SRAM region
> > Changes in v5:
> > 	- Rename the property 'qcom,imem' to 'sram'
> > Changes in v4:
> > 	- New patch
> > ---
> >  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


I have a few more cookies (stored in a fixed IMEM location supported
downstream) that I want to add, and they are available on all Qualcomm
mobile SoCs. Should it be added under SMEM now?


> 
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha

