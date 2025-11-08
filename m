Return-Path: <linux-watchdog+bounces-4536-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1A0C4321A
	for <lists+linux-watchdog@lfdr.de>; Sat, 08 Nov 2025 18:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6123F4E12EE
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Nov 2025 17:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8756D1DE3AD;
	Sat,  8 Nov 2025 17:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EA51gMXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eO50NX/8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE535B67A
	for <linux-watchdog@vger.kernel.org>; Sat,  8 Nov 2025 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762623503; cv=none; b=ULSezvsXB+bBnqshyaKzOfjruB3Ax0BSmyLqJ50bMicR/trWQOjbPrG5lL/PMogCCa694LvH3tPNj6UCmHN+3GFAc2QnRB960sZMZhA0Nt375+sr1JpEoi4ITkUELjrWFo3rGFb6vcdTs5fTtfTn4yOAflAQ5Qfz4LlfHP9PCo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762623503; c=relaxed/simple;
	bh=Hvpw+pRntckNWq+r2W3D6IoCt2L6QAauNS44X9epUro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFvyUYzJH44jo1fVkQQ+yWtFQoMatoU8NPAEewW9BtwEVznxMrVA5Yq/Co7g+qA1Y7gs9RGY8XNFcEKjDx/wREH3oXw2lldF9aZjcrqbk3AiauN2+0DlMm8CLYL+szGRd2A/V+K8ZTMR38Pj6GtWlnOtqpwQgBCtamzgRSm+U6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EA51gMXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eO50NX/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8FvHJt2299188
	for <linux-watchdog@vger.kernel.org>; Sat, 8 Nov 2025 17:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2umMsr4S5HW5lXJ3fQAZdAbM
	0Mw1K+JPW/3AzeFNEq0=; b=EA51gMXPovcwpq9qK8cYNwZLshlbBjwspo/7m3Ll
	uANgeVw/VlXUqn2ydVieNhIqD7MKH7kI1EHrIt8conl34UFFZtkZfWC8vmE46ekt
	uWz8HfcPwz4ys3sb/oRKIrtL4yi8IdAskRLQl/KI6pTQDHeByOrwfa5GIKK8rVQE
	tikjktwBN65v194ZI1r2oilp3Yi9TrLg9NQGa/hJJMpnsf6SnQ6L/TeB29H+TNSv
	Sdm0EEr3LoYPQkm1BoNqnWTGEmJnPwNygNtSpTzMOkIxiDbWC/l/a54ImqV6q1A1
	lHz8xKisS79LScPkMYf/DEitkDmcE6qURChTdHJhjTUUyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xvj8x9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sat, 08 Nov 2025 17:38:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2359efeb3so398617785a.0
        for <linux-watchdog@vger.kernel.org>; Sat, 08 Nov 2025 09:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762623500; x=1763228300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2umMsr4S5HW5lXJ3fQAZdAbM0Mw1K+JPW/3AzeFNEq0=;
        b=eO50NX/8fcamUAFGv9cvO0DjnmcmRVmwzvNOh/uipptMMYJaE1FeIPGv3wQR9SCjT5
         nn1Rw1fhd3P0ejJkNrCW1nAF5kCCqXsKTtQn2UHR+W50kxnvED0PUxf4kkCLsfe1rGqq
         Z+yabp0mkvcow1Mu5UN2/9AJn0Acdq36VZphLLn86z5ss68J79tWz2mc9iQDGsn2Ib+9
         ovcYRGjKP83Bmgm4lsrUvbYo5PTgcuJIjmftlsQwZ+JK61LeZMLu4Y81qWgXOdpn1UDc
         OI/BwJDZ6e8Ifz00L/KjuJWEy2E0VPgQbGDtiBfrnEbO7ZZzZKritx8x6GsK1oVIpuHF
         a5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762623500; x=1763228300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2umMsr4S5HW5lXJ3fQAZdAbM0Mw1K+JPW/3AzeFNEq0=;
        b=eXDYszS3NL+7osFI3D8t3LkTWqnKfwf/ILAUqJZIT55axevUMF6hf/d17Z8+fel6gD
         6wE2V8cgo8J/DXsYS9LG4krPVblZC82m+PyElN6V6ciIMIoza7LjR92ag+DSl7WxkOOG
         1hC1Biy0SYZQyMiOdmdgeMkd5IohIbNzxsx0lGjLDrvt6BU/AYCP8f0a55IXzc567/lU
         LXbyCjf4bHPoljHrVlLovtas1Be1BzqSZGY3aCSyaaym8YmX2/lRSx1pBfZM5RHDtSTY
         27YpPhADyIVT0draftaMScK+gP/Q6DBhhKpVCpNcZb0Oba+aD/a+k3hxwLtqrzBsC4sc
         Fc4A==
X-Forwarded-Encrypted: i=1; AJvYcCUTxAHJiRFEfpL+snttnA7//gRr/Au6P3q95/gOiZpyEbb1y88LPhEIPlxpNMREhP4FXKkv7qRxEY2lFVRG6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWBEm81OusKWWBDxc5TyiCS6ITIn2s+uC1VWiVZmp7IhF9ItTj
	uJcgkgaLjPA2bjqGaCLWBv7BrxB/jN13ZCcQTykzoTwO0GiJb2J8fOoXtwpvlrvURk2bJQZZnYv
	0SjeoJZ2hk40VdGUKRJk40787vnz4wqVMwg0LIm1stdVAFMJ4DXms8NyRHcUe0wdhFjTb+Q==
X-Gm-Gg: ASbGncsDYzqs3OVbXdshJJXpGQW33yOYiVuksBijFbqM6Y6+Nj8yp9ZIhnb1UALScUT
	p9NF0uUzUO336ZhE65w+sQcHNz5kHDfnvVQuaokjhpw+NvhQDtgy68UBWA7ShBmIrXU40IzEX9P
	1RABFzi1DNpYnu1gbvMBG61gZQJoYLUJdMUu1joqoN2ez/Sxr79lPD4rId2TuONLIL54/dHL3qD
	2gZZLKUSR4xMlLvdDuo88OXg+dKiyMakSLTrassNC7cN5aehgCySqJGadHtez00Nvqp7bsb7Eo5
	hRw8klrbQeY+c8aQbS79Smi3QJu7OMi4PHaHYW7G51Kbx/Lr192aLwHfdnzXxGHSl91w43RRkxU
	2otmhew0XLsf/PPyAdSv+tvu+/Z4uDrRZ+QdcVV2TG2LejKs02O3maCAHCDX5lSTjyv+TBoxs9Z
	PdxtoQoLd5gbTL
X-Received: by 2002:a05:622a:198e:b0:4ec:f2e9:493e with SMTP id d75a77b69052e-4ed998115a0mr78969221cf.34.1762622809650;
        Sat, 08 Nov 2025 09:26:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwezJQcmvFQWoTFXSG44miuWH+tCs9KRjF2cifamxToL082Jokif4YFw4V81sX3jhDzcu6dw==
X-Received: by 2002:a05:622a:198e:b0:4ec:f2e9:493e with SMTP id d75a77b69052e-4ed998115a0mr78968951cf.34.1762622809169;
        Sat, 08 Nov 2025 09:26:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a024f09sm2345136e87.41.2025.11.08.09.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:26:48 -0800 (PST)
Date: Sat, 8 Nov 2025 19:26:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: hrishabh.rajput@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QuxTHFyd c=1 sm=1 tr=0 ts=690f800c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YueeOpoQ0xcX2KNfXj8A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6AbPd_GvBW0SgMcnwG72bde6CBNdc17Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE0MSBTYWx0ZWRfX1JbRLCEnVO0K
 8BdV0fNJYKuKnpzk3HBMV3MyKvb9N0CO0wxOutd5eHaeg/BmmIyvb1TbfC21DaKnMvsNN0xPkzG
 ncodAJENlqKDWPO5jtYiWOPZSIA51z0f6Ezora2amyW7P2TVlrgfmAUWZYXpXjMujVNWB67RR2P
 rgSbenncNkzLkVWKNGxCJW/Yw6LWftfQ/jW0/w1N/bSoGlfijWIx0GaCr8wseA/JtvHAs6A6c39
 Eamx3k+Q4EBhoSVrOhzsB7IacxLdeyZn2m3fkFX8rs+MXGV+LV66poqnfC6Pt6QYp/MyRM2pEi4
 945N4QZqBsEUKAtmgAgl1Xn3nnINmIEBCliq+5l0qqMFu3R/Q3bC223IQh3w9teT+9EjfCVvnbB
 aCu+G6nnPH5yMftNwyxU2Fn8TVCalw==
X-Proofpoint-GUID: 6AbPd_GvBW0SgMcnwG72bde6CBNdc17Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080141

On Fri, Nov 07, 2025 at 05:53:08PM +0000, Hrishabh Rajput via B4 Relay wrote:
> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> 
> To restrict Gunyah watchdog initialization to Qualcomm platforms running
> under the Gunyah Hypervisor, register the watchdog device in the QCOM
> SCM driver.
> 
> When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
> expect Qualcomm watchdog or ARM SBSA watchdog device to be present in
> the devicetree. First, we make sure we're running under the Gunyah
> Hypervisor. Then we move to check if any of the above mentioned
> watchdog device nodes are present, if not then we proceed to register
> the SMC-based Gunyah watchdog device.
> 
> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 51 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index e777b7cb9b12..71b79c0229da 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2182,6 +2182,54 @@ int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
>  }
>  EXPORT_SYMBOL(qcom_scm_qtee_callback_response);
>  
> +static void qcom_scm_gunyah_wdt_free(void *data)
> +{
> +	struct platform_device *gunyah_wdt_dev = data;
> +
> +	platform_device_unregister(gunyah_wdt_dev);
> +}
> +
> +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> +{
> +	struct platform_device *gunyah_wdt_dev;
> +	struct device_node *np;
> +	bool of_wdt_available;
> +	int i;
> +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,

static const?

> +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> +	static const char * const of_wdt_compatible[] = {
> +		"qcom,kpss-wdt",
> +		"arm,sbsa-gwdt",
> +	};
> +
> +	/* Bail out if we are not running under Gunyah */
> +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> +		return;

This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'

> +

-- 
With best wishes
Dmitry

