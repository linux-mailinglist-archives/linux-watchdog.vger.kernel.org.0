Return-Path: <linux-watchdog+bounces-4975-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HDJIjNvnWk9QAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4975-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Feb 2026 10:28:19 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EAD18493F
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Feb 2026 10:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FCC330383F4
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Feb 2026 09:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A02936BCCB;
	Tue, 24 Feb 2026 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BiaqOVCS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASWi59JY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABC336C0D5
	for <linux-watchdog@vger.kernel.org>; Tue, 24 Feb 2026 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925297; cv=none; b=Fdl1m9H/aPEvFtBSnl2w5PDbgiLe9Idr5kL2pY+u4l4IysBOlEplLxMuklsX6c4jdwxeoexrnSFiIA7b+G10bgw3U2QmhVnw8qznUrNhbvf+BayARxPQg/HCIzjQeD+E2gmIroCAbfwbatA/c/AN/KkDnVR8rAl8XOGgV8mG6aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925297; c=relaxed/simple;
	bh=BUYiHZMDg5CiQUEhI0NrAWFyLCOt5zr49z+m36g57As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9gxfDEqLCq1unKPNO2ZfGeH9jvDt9k5M/UIgMhCjx48h/e170/Bc3I3SXo4E8ZTmWbdF5R85RgMbzK8FieMRcTSHE8Q+isayB8AMQTz0aV0bQOJsHqHqRmjr3p7oZKoMHFA8EZ8O10++LehJDt+oVJ9sXv1ScWTB6honbnBjCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BiaqOVCS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASWi59JY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4Li452808544
	for <linux-watchdog@vger.kernel.org>; Tue, 24 Feb 2026 09:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gPqtSj6o8M5PV8qFj3UT/bsM
	acHXiGqLaVAMN4CT/dw=; b=BiaqOVCSrfECB5ga3NKgy8g3K4aCBKEezFT7QC1l
	4WVigIx0m9qFTLyRncCIHd06O3yb4bliHwIM+eZ7i8kMKhvrgU8Nen+PKSwMKUfd
	MYA33NzwOC10Inr3wD76FuzmuNNpa4El8GEVNsYP9+ZR0EOTeuyDDzNQEhnQf7+R
	d0XPWZv9cPVA7mYMfpjw3xbp8k62qp1aCM4JsvWG/yWfW7ZhR+VemGNLO9Wdy4bD
	MLoieNI6A1s6sx5pUxvbSJD5+fwv/HevP9WoN+AF6OHP1msuRZabfpwcVvKt/PYD
	/lsv1hqavIjCeLHzVKuFm9/5OHmlnc4xkrJGxMw1JmRkqQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8rbq5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 24 Feb 2026 09:28:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6de0bd0896so27259022a12.1
        for <linux-watchdog@vger.kernel.org>; Tue, 24 Feb 2026 01:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771925292; x=1772530092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gPqtSj6o8M5PV8qFj3UT/bsMacHXiGqLaVAMN4CT/dw=;
        b=ASWi59JYu2qnN8Nn8XxK4o5291nCjnfE0uxxuyzA2iEdxj6dgSqECxma4wlrBnhSQX
         WkhL7Z6MN0VDhwBI9FppinakgmK0TsBua6k6sLP8QaPYrVwaY+WwbNVUhk0urVlUc7qS
         anBCxbjKEWxtI5JHKc8cv3zKSHn+QTm0b5ZZ5RvxPdQCAEC+uSRzb5rNgswNyGvfQ0De
         4haNY7akzMrLqhx9mCW1URlW0++M72vOHmhgG0EIbzjsYGBAug4uVIVjK6tA2VCZMsEP
         68rPW4tEQ9aOE4ku31/RETz9SRTwYAS+xFwj1vUsqjOJqlO4quURRT8BxB1+/DjeVjol
         PIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925292; x=1772530092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPqtSj6o8M5PV8qFj3UT/bsMacHXiGqLaVAMN4CT/dw=;
        b=Jh0xj+Dcz0L8e4pp7Jzn4oO1afXEgJAWiowA2daBVO6jQ0QYITD/lgDPKVB2FPTNKW
         VFB55cIcRea6AJUKe7rNST2voJwVqMpTCWkPXr4lN5gPs3rvQsIJ9FZ26oytmWEbbn5G
         R3LdCNGI1MVD/hB5PewmVgDL6DfZoBUuRM82Id1gRJ9ZhV34YTmNhgb3dfubzqECvOgB
         g9Lh/xHCaNuDWBXOJ/7LRT9fIFWeGRH5tyIiBNWE2vg82QBwEIY0syuHaZSzXddzY3UU
         XaHdYhiCZm4A3kGg9KbZ9/yecuCsDabhMWjzDsyUThhDtFN7p72r11+YRT7fSCnUEyeW
         e2dw==
X-Forwarded-Encrypted: i=1; AJvYcCXUF9DFFbR4hbUG8dX5FsWyzPJWfQEHiCmul9F/fHJD02yYHlhEAOjCbPweDKH29+5OCUgg+HlIlVlL9CM8og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2TIej4cDeXpdiFQl+PbdRp3JLOtoqx5CC0c57qAqKo3Bhopug
	zH4wXb6Q2cmWATxqf0t9eHAnk02zNYOKRYAT1ENsFDOa/Q4jBvut7fuiswflBrUka+ADxdkd0r5
	MN99HGm1xywv6K0mMTlI2QZ9heFL9EhdYtRCWZ9bJmN1YTUg+y7UDBXm7tncnEZuyDKVHsg==
X-Gm-Gg: AZuq6aJnKHiVjxkRAeuAsZYdGDQwCcbGWDClELVBoTFCZjn0Jy/05QfAo12OqKrOhbm
	9Tvyi5GK+L1OxpG5o9xV5CUaOEQZVCcx5wlekmXNuKNIb8lYsghDMMXB5zQnIEuluJrUlGktCCx
	GnWvONupt4QkZFKftv4ZofPNjOCIQH/H9hCrhoXwr6l7k4Ngsvy/14EbxSWS5REQsdGqslo3WHO
	hJi7aM/jJGh5cAND0WDGhbgaEcyefQCXPVIptixy9CV8tmfRJMq70jFI6RA7g7BdF/SY0vrOjln
	osTZd9VoLMb4moWeYzTaVz+9/CBUgZuAyWcNFAOcUvpAJQ1L/anoiULqEv9a3jSUAkcgqrc/f1Y
	VZUgMZ0S8FtFkgNWe0+yiH1uDtOQgjMemyLi9+BvO3tFi5DOFQHWUCJw=
X-Received: by 2002:a05:6a20:1595:b0:384:f573:42bf with SMTP id adf61e73a8af0-39545f8900bmr9357820637.53.1771925292292;
        Tue, 24 Feb 2026 01:28:12 -0800 (PST)
X-Received: by 2002:a05:6a20:1595:b0:384:f573:42bf with SMTP id adf61e73a8af0-39545f8900bmr9357803637.53.1771925291774;
        Tue, 24 Feb 2026 01:28:11 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f637easm97694695ad.37.2026.02.24.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:28:11 -0800 (PST)
Date: Tue, 24 Feb 2026 14:58:05 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/2] Add support for Gunyah Watchdog
Message-ID: <c5a57ab6-ad6c-4228-8ccb-7d7ef306b5b8@quicinc.com>
References: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-gunyah_watchdog-v8-0-e5de12e2eef5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cxTiWWumOmYcSBWino9aDD3iiZhdfrC6
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699d6f2d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=YScB8c1TSMsKagIZej4A:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA3OSBTYWx0ZWRfXxwRcyHEvals1
 ZbwUQLWOgDZnbbr6IdLr70gshBOADVVomAiW7cq1uGUcecSJlsXPzofUXiLunkPGGz4YeytUNdU
 QhBkSoGfHJTI+GL+25YWioVtzAfQQmydtQ82aHG8u4DrZvmQQjK0sSQDgYlmiAsX3qE0UOp3Y/1
 NotmW9USfuO8ZDgl6x2sFAUKSzxmcOXScCI4TG534iThUMM0H+CDI+hgDDqtUkdoVmF+1mFyUX/
 yru4D4sDM32CQstwVbjYx8Bgh2dU1+uZTKkUPnAA8UEErI3mQTIWP4XlTwwP2mAeN2vNGq9e5zC
 WyY8N2XoAFklsX84MaqAjFFbddg8U8PJRYFgcCq/FuFGr/TRlr+hpwbtw5ILnXzejaAR8TYHqtA
 F+bdHF/XmiicEj5+1A3goZ/7HIuXdWKxX5t/99qa2Yz+HJputfE39h4UVc60qxfLMTwqQ59CU6i
 AjEs7+zGCpHfqPRFw5w==
X-Proofpoint-GUID: cxTiWWumOmYcSBWino9aDD3iiZhdfrC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4975-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavan.kondeti@oss.qualcomm.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32EAD18493F
X-Rspamd-Action: no action

Hi Bjorn / Wim,

On Tue, Nov 18, 2025 at 10:40:55AM +0000, Hrishabh Rajput via B4 Relay wrote:
> Gunyah is a Type-I hypervisor which was introduced in the patch series
> [1]. It is an open source hypervisor. The source repo is available at
> [2].
> 
> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> access the MMIO watchdog. It either provides the fully emulated MMIO
> based watchdog interface or the SMC-based watchdog interface depending
> on the hypervisor configuration.
> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> 
> This patch series adds support for the SMC-based watchdog interface
> provided by the Gunyah Hypervisor.
> 
> This series is tested on SM8750 platform.
> 
> [1]
> https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/
> 
> [2]
> https://github.com/quic/gunyah-hypervisor
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
> Changes in v8:
> - Fix error handling in gunyah_wdt_probe() to fail silently with -ENODEV
>   if WDT_STATUS call returns -EOPNOTSUPP, indicating support for Gunyah
>   watchdog is not present. Fail with logs for other errors.
> - Link to v7: https://lore.kernel.org/r/20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com
> 

The series applies cleanly on v7.0-rc1. I have tested the watchdog
driver functionality and ramdumps collection on Kodiak RB3 Gen2
platform. Can you please pick this series for v7.1?

As Hrishabh mentioned earlier, both patches don't have any compile time
dependencies.

Thanks,
Pavan

