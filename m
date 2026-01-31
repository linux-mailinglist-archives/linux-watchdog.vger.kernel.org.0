Return-Path: <linux-watchdog+bounces-4865-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBnOOHC6fWmoTQIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4865-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Jan 2026 09:16:48 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF60C1353
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Jan 2026 09:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 657D03019469
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Jan 2026 08:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10B133890E;
	Sat, 31 Jan 2026 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuA6+4Rq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbB3CrX/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4822BDC27
	for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847387; cv=none; b=InsLRclBfFuuOENwy1qPgSGvB6veXo+qQ20FVFOP6wSqzBEAhckvjHZk5jZjfSqRL8TNitST4R0yzlsgTuWUNnF/Bj0y4dPbGdaTiVfRAbMdKrmej6ijwItf5y2+RLicH5dg62uPoSiDh4tlc7nrVWVOk7YZU0da0HowyDKgxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847387; c=relaxed/simple;
	bh=MkAEtIwAd3Whf5y3uYKu6eei7F00jS4ZNUIVY09g7vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dl5mPR7ELo/wBZpIfyGnXTfA6VXILc6sXJczXkusWd7WJtGMGValKC0fGNSjhb3zh4yCH6rnvhWcvDAa4CAIJk/HZdxEI+bhE00C4qVU36CVyQwViVxgZuL1WyZgi+GSaoTmNoZO0gO3vKSoOk/7ycsYgZEkxPWHLyWCuu7rTBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuA6+4Rq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbB3CrX/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4UERW308635
	for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 08:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6V0V1wIdAM67NqW2ut6Q5A4E
	FwYuFEvb6jNCa/BYPwU=; b=PuA6+4Rq2K0mS/Rj4loZx/pIq7S1kAGMGuAXImu8
	PK6VS7KEStxtEaodlAshxGWvhPoi/PdQogUWTRQvOK5+ITEtuTI2LI9sE+Rg8Kaj
	4gW+zlsxl9M/tfa/X6LDg0OWi5ysujAVTgDePXwumHGgYY22gQTSlqooV92zxqWB
	fZQTrISz06jfarjq+VWaZikeZwZuz7QPjD9CN8d5gQ7vbrFYdMMqWY4DUPuDp0U3
	pk/bFgK9uA+azPi+cnTx3bYlV/gXaWJZgAf4XGR9r0Ba/FHrl10QHVmS34U8MJnS
	baW5IR0Bto3v1Azpnx3MEXsnVaL4E8GRRBbLhbmJ7kNTQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4rfcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 08:16:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5e166fb75so866579085a.0
        for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 00:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769847384; x=1770452184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6V0V1wIdAM67NqW2ut6Q5A4EFwYuFEvb6jNCa/BYPwU=;
        b=RbB3CrX/vP4OuxUoL26WKr/adqHTSat24ngLJwjnkORty6SfmdI+P2Jn6FnYSO/JcM
         3QYWXA1YyJvARfmPOA2mCbRGu2XHPwktihEne4tqVe1YfMyUooSto6KcBK8kQ0J5OIdV
         MOVNfX934BgVL+6DEQ+YSXgBiuPsn4pDBOJwYe71J/9Ez3Yi5Zyvhd456XuOxehCOURh
         AvOH493iGeFCy+QY5/kLg7B8EsA5uB/gwdUVVCzxGLGRaAG8EGHCLouCjeW6d0TjwN29
         pVGNaZhkbtyWMX4byl3ODaQ+J+MhJtLE3grNg94/tuUS6bcj0eFfPUeR4VBntzeEnGUj
         zXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847384; x=1770452184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V0V1wIdAM67NqW2ut6Q5A4EFwYuFEvb6jNCa/BYPwU=;
        b=jtKNXg/yMCFRQEBd/j1XVzgcyc5C9JJWf0vIomfoEemrTF5+EN2iNviaz9KjAiiCRE
         R5vIPWpRlirSq5Ilk5OftihvPtntRXPwta4LOr3YfKGG5XBNmg3ziSndK+iUxdfCbuV2
         L8i7b6CL5sV1T7bI5alSKkLvEwzxXK00syoYesuZNaLMYvgSsXWoQuNTI+Kp+mhjy+gK
         2Aiods5T8Wj36zYHyilJcfoi6Uez1E7nw5KkuO6nLjDqs6raBrBtFRG1B1D1EyRBSI3s
         P14zEtRYrhGR6qvBU6gPvk01Gd0bZR3ymL1iHoCtwUsYxJMHfMJNgi/somU+Bzt5qnm9
         51mw==
X-Forwarded-Encrypted: i=1; AJvYcCXEDS9J6TpgzBU7IWIre0GwZNsXgyKEPbok6O1+GamfbdkPIhwEbG4VxB5Mrc2bf3sGyEKbxcB9Wqzz0l88Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUHT/NrSh8jztwJiMvyiynpertGnv53DMejJllNRmgrCAOY7+r
	ZBDdB9fSaNLmUOvz5l7foAu+OoRHsGY1mirRJp3p+t8VFzoHJNF1XlEmN3qdGEFKec9e3jjSVy5
	zgce+N3DcdBxLbvCuG9SR0z0TQ2g1nXkUqwK/7EM393x8fimJLyI5qJz+h0ycVFcIAVitrBJktB
	8y8w==
X-Gm-Gg: AZuq6aIgDvrVC/K+lVuAlwL5Biz+UQ0kmktNnpkreNmfQeodNcAUP1/SQCJfCxv3uDa
	qbW5VRii8w/es/Q57PTpUp5Qj3Bs2Xe5KOWm3Uiul5HDDX0MN4kdQBXqyTrv7ONlTJHIiRho4nV
	pDzoFJ6yPhhMIvv+Ik1Fzy8YgSNOlm5bcaQlJfiLkX+cEgRz5dQj82NTog+ZQbZuCjvYodcJ7c6
	EFXn1ht2ZwFH+OmB93H7d/NG6/97r7AaJBkLuH9AXJsZb7+mi4MjSELlaHi+hAWh+v/4EN4gwO9
	gC+gAAJSQzwWoLM6zD3vIVaoc9i+MGFHfAqUpYmiPIjNIwZ9AgMFGsEJuROjTX8wPKRwZbB4Iw/
	uBWLVMtmheBa6eIyTM9Ib8sO/kkcnLTpAXea12JIK3bRrZU4MxhZtxr5a+7/xgm5Mr3xnX2Azrw
	9soU2Mqa7NzyKnQZ2BzXFbS0o=
X-Received: by 2002:a05:620a:3195:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8c9eb25f5c8mr706280685a.25.1769847384358;
        Sat, 31 Jan 2026 00:16:24 -0800 (PST)
X-Received: by 2002:a05:620a:3195:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8c9eb25f5c8mr706277985a.25.1769847383921;
        Sat, 31 Jan 2026 00:16:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c8225bsm17946601fa.18.2026.01.31.00.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:16:23 -0800 (PST)
Date: Sat, 31 Jan 2026 10:16:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Message-ID: <iy72jfigw4kk7bp7d2lqgie4jf7ulphmtglznm4bohslno6vmt@b45v3razslbn>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9TCi3HZ3mOMAV33i9-AFui-NGt_C8eGr
X-Proofpoint-GUID: 9TCi3HZ3mOMAV33i9-AFui-NGt_C8eGr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2OCBTYWx0ZWRfXwFJxgpDDJAYb
 2tbyb1rCbYU/NcB8VLMW4n70o0l6k7BdVhi5mp8iN+k/CgwmiOuqaXTZItproUJNFzc06MkGJl4
 sKxUkazfaLnZW7L25GRkzp72QYpWT1krGeyDEHChG61RtUVo4fdVQtLi68cEwFZ0bkrPZJlTq9i
 fZ+CMwkv3ytn/GZmfWiZBL4EdkFCcP/2SYjcfrvmAYkSVZGRjksS8fRTXFr7hVEDYip7IDbyzSA
 o0rMZLdNBCeLhMYiBALz4vLvaccPHhFg9lhX+B/UE5QG8aX9PTheoxfubwwmeTv/UuM9Hd65xo2
 9GYdapzXYWRU2vbL8FY+h7HTzLrSR7jKay2aOPhri5cOjBzzW28To82/Cy9Xy50bj5ykaFa2Gqj
 drsIE1aPPwGlsnUcfVNXVTpksV0EtwBd2T79u/w74HEj+yjHwJ4b7J3BDUMsJo/TQHNIvMiHLFn
 lQjMgaW8loOBhvNnSGA==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=697dba59 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=o4o9nyK-Q1O9M6IKefoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4865-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DF60C1353
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 04:14:31PM +0530, Kathiravan Thirumoorthy wrote:
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

