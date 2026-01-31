Return-Path: <linux-watchdog+bounces-4867-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLhjKHG7fWm4TQIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4867-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Jan 2026 09:21:05 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A3C13B6
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Jan 2026 09:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A6603003805
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Jan 2026 08:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4408306B37;
	Sat, 31 Jan 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwPppWFT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anYktR0y"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4142EA169
	for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 08:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847655; cv=none; b=ICRp31rBEJIkjd8CbHJlEeVOTLDRwsBgRHZ5nY1u3D6vfWysm0MjcqAl4eqasoSuXUNw6fVnHfxbFbFTBK/mW8v3D0z2QMQxEBxL2tInAQgUH/B8317bTLEaraweegKXqGrn0QaPef6keELvUUgnaveTACeqmqkxNuWKPvjJsMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847655; c=relaxed/simple;
	bh=DL6RQXTaFjh7ka7FhddEp9n8CkpqVnzfL2lU3F4s6ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYrTREs5oYX79mqv9DFV+ejC9D7CQwBTXAiTqjj9q/423ZSYD1747G5Mb3CPl6z38/WqY6nk6MKOAnUPSsJ1nu12kB9Fa+fvNvr7Cn3EY/iJxXVyCbEXIwkwHK/9fPZF2phYwB0bIw+0BtxGBKAlOL/Tl1yexm7YFoB7145uHW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwPppWFT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anYktR0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4bkFc1061483
	for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 08:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=COmFWv2JExG1Iu82MeDLsbXO
	3mvVpSI+IVRX7pQn10U=; b=GwPppWFTYNZJXF8WMWUtKDTngfDn6gT5MeXIVKWf
	pEcgX1H7Ok0i071uJjY2X/AV1795e77GuwWGhQD5P9d59yIJeuosu/ou9MYFnz++
	n7lP81CALmnsj+6PR1593gfRpv1HJ5fN+/dwwg22VgI7UbCiGtkRafws2B2dOB7O
	bpPT3ZTWbxcDwTntDxVj20IdzB/TwnDtGs+khqLIb1Z3Jp/GIAIUAcgDpSXlEGfa
	ymvl1qeGFym+sr4ZjchKF+AVGDqHJdwroYqoIrzhh2fcWPYcpwDP8VtV48jN8QTK
	Tc9z33vdBujXif/E59ZY1HzD3CPSyK7QcgBWN43k37UzFw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avngepb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 08:20:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89471079a13so160860486d6.0
        for <linux-watchdog@vger.kernel.org>; Sat, 31 Jan 2026 00:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769847653; x=1770452453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=COmFWv2JExG1Iu82MeDLsbXO3mvVpSI+IVRX7pQn10U=;
        b=anYktR0yu4b+dejLg86PMabuDAbelfyeGKt1u7nBI1z3JS2iVzPZSoctd+NCuNGIZ2
         QyObNVtdA4TTx8KP/dJddOIURs3Mp80lVsCOW13p0ETG75RdQ6SH8GHsdHWISwT4KhXK
         J3o8hesxiWj729KBEWcuMm8yV/zgggqCjP7+R99XzrTFHNDOqLIJZCrTe2wvLr0uOEN3
         OBYgB7SY+Hy7woW2GWARudxczLMUNS8xGUPCDfX1wlL8ULHY9CkkuCiUOugyTADMavfR
         yPznVxVXeP/1kgR5ghhMko9/n3SmSGfArYYjKnXgHuZlkrW/kCplYo0eeb+qOVPM9r1T
         kJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847653; x=1770452453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COmFWv2JExG1Iu82MeDLsbXO3mvVpSI+IVRX7pQn10U=;
        b=oakoa1ia3abGH5wUAM5ATmj0ypQWjF7exMQW02IYmW4WoBu5qlOw5NDxvTXBt2MkU1
         SeAbfJKgIFMAO9FVyYZfBLzUdwUU3xE/hw/CaZbaifrf1EJJ3pIAs2DTorNbh7hXfaP0
         IFcL2qpOFoSr7DBnc1nuSu5/TNiwxY5LXtqyccvyOG2+bW0K2ENJopohXOvrREo+WvFg
         y2Ez08L5/aZaa2JsVHkuEtpgpD0cxKodm0/wTJ1bmUhsStteUPjylgfSTsVbGJRNEfdR
         /XCcU7Y0TJ/bLocmCzSESRxat5ctTDAqhvLY2fwvrtjUEYqikrc2A/xr88+KeuSBTUBZ
         NdNA==
X-Forwarded-Encrypted: i=1; AJvYcCUt1TAWZy1VDBEBvoHGPJEmwI4o/3Nn4mABzAyar44fCYI7d5Apj04xXQn+2GCSMTJth/ULGPxHNwhxV8Bg3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFSPGv32TqzbTV/zg8ZWsBXb3ifx3arsHxOwOuvcrFHqK5ScN
	rYWrPhaMGjyTh0sOFFbIiEPcTEtiotfjX1FRPVQGScQP7xGvDBcNAY8wpMbbaT5xa5eYKR0i7eN
	u2VM23ssHq0r6yhsTZZo9JzUNHO3VVkVyTNKxc4jeAxy02sxRdXf1LJKJM0WQ40UYUXqv7g==
X-Gm-Gg: AZuq6aIEOQlgoEEjloeOwpfE6EtpLMat2SWOnNQd2NssmuzZSmgL6hLWGYtZ3EdzRq2
	Dggk8X+9xYxFW5dT2FtOQywmbJ3qrVIjLSOjXG5cipkCL7H+FDu9EnZ5wIoob9q1xuKO0j6GA2c
	rlA73U8cYCBBArDYCnP5aKpVzgTRqscbykcMd5LrqFjexpq+zrR966n+KVDhSMbmkaUduwd4ij1
	ikFZalg9lsAC1OKxVVV+AC61Rf+i2oOPh9chNaSBNNweKzyV6mheYniCSojgIDO3wQhDIbZo8cJ
	YkCBt16veoWhQ0F/27Utqomle9m8CPKfYjFHzAMr+lp0ySXjQQ690n+V/6pQW6mNH/rVn4EWrmK
	ZBrSjaI1HlokVsp2Hg7aSu20hVwLN6+hZrcqX/mtqbiEPHMyl0GgzoBHIsf08Yeq61neNOvpMWV
	Zpa11elIvqBxy2Y9WH3BKWq4M=
X-Received: by 2002:a05:620a:2a0a:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c9eb1e67b4mr777393285a.8.1769847652564;
        Sat, 31 Jan 2026 00:20:52 -0800 (PST)
X-Received: by 2002:a05:620a:2a0a:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c9eb1e67b4mr777392485a.8.1769847652078;
        Sat, 31 Jan 2026 00:20:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c61882sm18873461fa.12.2026.01.31.00.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:20:51 -0800 (PST)
Date: Sat, 31 Jan 2026 10:20:48 +0200
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
Subject: Re: [PATCH v6 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Message-ID: <2cktheoo5lmh5odlvc4iad7gclx3h4hltg6rbzphga6uu7dbaz@3p23jh5nxhuo>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-1-417ab789cd97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-wdt_reset_reason-v6-1-417ab789cd97@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4K_kWqb_IjCs7I9bc_Ut-ytewzuHsdoj
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=697dbb65 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HBzuxA2VYrXHyfHpFaMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 4K_kWqb_IjCs7I9bc_Ut-ytewzuHsdoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2OCBTYWx0ZWRfX6vZ3FbQbv4CK
 /0hL5x8ykPWO+Wr5Goy1FxTPYZJlWeINLJ8raULHCb2zIUJHm4nhDNzxveavClF8TtXqk9/vN3F
 91+vcffJRtD8dyK51OPTd9RYJkFnLamBT6daR7i0ruPpzKCqwdEpluWm0tBQX6N0ubNCenwDZdQ
 6D8H74NJguP3Ad3CCQwjO687yrAFsjLYf9EpW7/X7p8OOCVr5TjVGngcUc18SCuQV77tweFZh6E
 /Jj/620GwcirZKKE6LjLPdfaOBkzm3yPQrCjRElraCdBqvDXLIy8w0E+Qvylu57l9Z/7/A7pdJc
 RIZNcv7QpgcVcXIWceR9KAi7Wc/SztoNyI/waTuhyWw+fDRmpDvv0sb2qcekX7749sYhWtgTIYg
 /fdP7IT3c76u7GLGtzmBchB4Cry4dsS4hWlv5C1QJr/k1vXIoE1oPqpXptnUnUI8G4vjiC1911/
 7eLdtg+v43aDnXUKWZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-4867-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 391A3C13B6
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 04:14:30PM +0530, Kathiravan Thirumoorthy wrote:
> Based on the discussion in the linux-arm-msm list, it is not
> appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD.
> 
> So drop the compatible from qcom,imem.yaml and add it in sram.yaml
> binding.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v6:
> 	* New patch
> ---
>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
>  Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index c451140962c86f4e8f98437a2830cb2c6a697e63..7bd24305a8c7d98dc6efad81e72dc8d86d8b212b 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -34,6 +34,7 @@ properties:
>          - nvidia,tegra186-sysram
>          - nvidia,tegra194-sysram
>          - nvidia,tegra234-sysram
> +        - qcom,ipq5424-imem

Bjorn, Konrad, I sadly don't remember the outcome of our discussion. Do
we need to specify that this SRAM region is Qualcomm something IMEM or
do we not?

>          - qcom,kaanapali-imem
>          - qcom,rpm-msg-ram
>          - rockchip,rk3288-pmu-sram
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

