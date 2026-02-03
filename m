Return-Path: <linux-watchdog+bounces-4877-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEx9ByuSgWl/HAMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4877-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 07:14:03 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE9D5173
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 07:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C376E301526A
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 06:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646B436B063;
	Tue,  3 Feb 2026 06:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggfyIGsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZvmAgqR0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8F036B049
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Feb 2026 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099119; cv=none; b=UzfgbvxYZnFOug+QRheXfoxV64hQZ0adRfseuOwk0+rw9WQjhJ6UDg+phYTBhNGtc/vugGNe8FTlG5lM/00o3IGOUmCpS6wjdddAHyltoSPE9PeNDf4ODfuAmQmM5ld52DYLNtvzs/IRSYSLqkbrnjyAj1IdZKdwRvLQiw8/J+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099119; c=relaxed/simple;
	bh=lYq5OeEefPX8ATcCKPJgex+PnOl8m+LXBIz+uUMZw5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTDRaKcnPE22qN+yRFqO32jDhW0zHqCE6Ny05uGuqQO6apDoN/1dcaug8il4v7Ewb81h+JlfTqGZm2Y0AvxA/L+DSWKI0UiBEjqEU14LgHIcl4qf6csQy0mQEcjEbWux7tEFHJdpn/CSI/gPG3pxJjuTcgM5l3UKx0GlSn4sYiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggfyIGsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZvmAgqR0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6133I5Q9933184
	for <linux-watchdog@vger.kernel.org>; Tue, 3 Feb 2026 06:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dFGlO62T4d2Cjfh6QnoBjJ99
	2LvGoaOKxRfMnU0jqhc=; b=ggfyIGslln91Jap5bwtNuArH2rM+8Q1bPqvutO7F
	F8pFf9huUohB1iaMbsAujWKRDdb/AeIXzZavrwrsGzesEBmRMArrxu3iLLYZw1De
	/R1SqMSk5SNjoJ3bS3Lyik7eL81gW5sqc+4j5F6lGjGtiJcMdVi6zAn32ma2tcJb
	pVmu1Y6Lk+6ljSWbRJ6his2sghJ70trUNoh9srxPeFI/4ReDCmOCNFSuj8n5sduL
	H/Kl2GdRZ4vWX+1QhCqySaa5EhK5kbjkMENikf6bQyIV5Z6rFj2jMcd2pZ37sEgi
	pukHiObywU9pbNj9b24VwX+t7xqOtCt0ZoFWqH6qOFvBmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c38yu0epn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 03 Feb 2026 06:11:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-352e195f662so4521602a91.2
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Feb 2026 22:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770099116; x=1770703916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dFGlO62T4d2Cjfh6QnoBjJ992LvGoaOKxRfMnU0jqhc=;
        b=ZvmAgqR0JCprq/oC7tjccBIELGCO/DQ2GWmKr0yUVQcrzUxoXqoVk9TLLsDxKTUPna
         JOyBa35+roR7ic3REwuXFH39PyEBs06rG0bCHzPPvm5bkrJ7jLPMgBTIv/ZkPSQwwEXZ
         VYsuL5r9PtEekIl6f8oDEqiqMqK209eiGhVZo0kQCRjVGbAHksppcZdn3r5f7c/cYxfo
         5Dxphy1PbEmP1iUHBt/Fq+NLssGaSaj1dhFMqVBxplHqw3TKD9JE3fQBUuHTMrcbCjQ2
         pZe03SM4U4Gb1DhSWGwIziN56CE3+HxeFlUkX2WNha9yDEluPr0gRQAZ0JQ02zd5rH2K
         kYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770099116; x=1770703916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFGlO62T4d2Cjfh6QnoBjJ992LvGoaOKxRfMnU0jqhc=;
        b=WPwvCh5QY76aR3cgCJHp1HCt3wc6HgimtsGKrWng0HTGPFSOrmq8zcM65j/sepsqX2
         gfT10FwWBFXE1yKWZwGBQ9pRjbplnaJ+mM1ANLRtxbCUCtQqexjYBKdBaSswZjCF/Vvl
         XoSqm3JedOQu2LSNo8jqXMJlS/4/iOicqBYmZ77I56su43f+MnlaF9CDkSvtnVBQY4WO
         Nw/7u2S0PgAO56wQLVea1LfvAf7lepNFrQ1q6ggkiLZUGIkzQtGlr9H04jIAlXSCD8kG
         Q107Gm9/ihRwZag14WkF20a2zGP9g+jsb8ubhuaf2BgUF8f7tthDFRtQoK5v+is0LVlj
         bMkA==
X-Forwarded-Encrypted: i=1; AJvYcCXmBU1dBD6bcblOzV9RW6rhn2ncXwUTrptLpbOmHM0Yd0fr7lii10m6R3ZQULhHg687x8B9PZgqTg+S9lfx3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4M8PaWboNnzyFqtjHiPmwfE6a8huAv/mOgY+vQw9J23FKbnCR
	K95Y+vViWoRGJOmIumtyQWYv5ZoDijNPyWn5MEeyMRszZ+qWWhd1fzoNbayN4MxnfX3xeiXl7SH
	7/EMSm56ydLX6iQVN8OPT5ILczqOTkrM6h5W6ntp7ekgFHOwRMz6rmP/caah8j7xWW/0NnA==
X-Gm-Gg: AZuq6aKfWyJG2iZT+SaUeiFV+5FvdCYXSJn2IVgzcDtzj1jF5Jk6EVhRlVg0KD71HD3
	nFTpr0bVTXGzBOovmJ9fHGcJLheeRrmE+SeYLrzEGlLtgC+WOMRTkqdSCzVbzqGM1t/jG15ns00
	+D4VwvORQ7e4M0MbujDb4fjZNAR/woDDkaAQVylHcn/8Zb/GSnMmRBt0klFwRn0a7T+VwLKX2Fe
	dXA4NGR6JaMJLbRnlJRQ3j8MwKDtEJWF8U1TRaxA2gp7I/tNh3ATiuMgRGO4OFliNnwLLV7uIgF
	BzYAg210acSsGR+mSiXGXY0Ze6yUhGBF3QEQAh2H0SVyJrwRdYiECD3Mtl7wT7Uhy3Ui4oDvNsj
	7pUcMOvn2IkhuhUa3BpXCULSyt+2mDeHjNqgI
X-Received: by 2002:a17:90a:d604:b0:343:edb0:1012 with SMTP id 98e67ed59e1d1-3543b3ae4c4mr12674751a91.21.1770099116255;
        Mon, 02 Feb 2026 22:11:56 -0800 (PST)
X-Received: by 2002:a17:90a:d604:b0:343:edb0:1012 with SMTP id 98e67ed59e1d1-3543b3ae4c4mr12674733a91.21.1770099115673;
        Mon, 02 Feb 2026 22:11:55 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35477763b81sm1455543a91.10.2026.02.02.22.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:11:55 -0800 (PST)
Date: Tue, 3 Feb 2026 11:41:48 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Message-ID: <20260203061148.zrusrpvkd5xiiaie@hu-mojha-hyd.qualcomm.com>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-5-417ab789cd97@oss.qualcomm.com>
 <5zqxloovexknbuhknbafc2trf66d6zwtvtkhjbchmbndxg2j6u@3giwqjkd2vl7>
 <20260202134402.ochfxv3lnju3dioa@hu-mojha-hyd.qualcomm.com>
 <cc9e8e60-7f17-49db-9a67-18b42571ccdb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc9e8e60-7f17-49db-9a67-18b42571ccdb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NyBTYWx0ZWRfX/VG/1hGRneIS
 lSox3fFqVEh3eCQG/pqO8l3LPfbSKBksEzzIURMYT6Zu1MInC9jIIIzBDNzf7Vki/Yqy8lBJRkn
 1Wda0sgfRDxOhyNnWAPod7sgbeVdw6U2rUYp4fxuIeecIIyy1/JLX5lzhF1kp8sNwyGjbN8KolP
 9plDWJm7g6jLlkZASsQcWUjY9Py62+l2iJjY9CRE9SEzi4JnDREKcAbggNyLuzEhfs6zsrghSsb
 dX4CfvtsD3gC60vg3eG8Leckj9s1b996FB+mhKMuE2x/uthB0Z6Tswyfw02LT7JCdo9K1Zv9Bgc
 gTlmE6jJT0SYxybDAQkx1Z9+TGp2K3sJMYW33e25BYG7W3ljoTJbE4wBQRGyv1CaTKsDncTU6uY
 +B9OhtnEa9CWGxGw22JC8AwXOdg73U7Jnh7Ih1bE32/fJM6nNjlJ8zhyAG2sZ2AQpVhczx3IxsU
 mxGARF3u+PuKmJbAkuQ==
X-Proofpoint-ORIG-GUID: i84nsxERllwPa_aBLL6IldHWKSNGwr1Q
X-Proofpoint-GUID: i84nsxERllwPa_aBLL6IldHWKSNGwr1Q
X-Authority-Analysis: v=2.4 cv=UKTQ3Sfy c=1 sm=1 tr=0 ts=698191ad cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mLgwGFatFkYuTAwP7tUA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4877-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 3BCE9D5173
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:05:26AM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 2/2/2026 7:14 PM, Mukesh Ojha wrote:
> > On Sat, Jan 31, 2026 at 10:18:29AM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Jan 30, 2026 at 04:14:34PM +0530, Kathiravan Thirumoorthy wrote:
> > > > Add the "sram" property to the watchdog device node to enable
> > > > retrieval of the system restart reason from IMEM, populated by XBL.
> > > > Parse this information in the watchdog driver and update the bootstatus
> > > > sysFS if the restart was triggered by a watchdog timeout.
> > > > 
> > > > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > > > ---
> > > > Changes in v6:
> > > > 	- Update the 'sram' property to point to the SRAM region
> > > > Changes in v5:
> > > > 	- Rename the property 'qcom,imem' to 'sram'
> > > > Changes in v4:
> > > > 	- New patch
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > I have a few more cookies (stored in a fixed IMEM location supported
> > downstream) that I want to add, and they are available on all Qualcomm
> > mobile SoCs. Should it be added under SMEM now?
> 
> 
> Mukesh, you mean SMEM or SRAM? Do we have the consumers in upstream for all
> those cookies?

Forgive me,. yeah I meant SRAM. 

> 
> 
> > 
> > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry

-- 
-Mukesh Ojha

