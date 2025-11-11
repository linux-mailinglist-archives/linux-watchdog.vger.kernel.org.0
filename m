Return-Path: <linux-watchdog+bounces-4550-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC490C4D191
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Nov 2025 11:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E04E84F5B7A
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Nov 2025 10:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CB334D4CE;
	Tue, 11 Nov 2025 10:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIvOqMg/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5XuHgVx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E034A3CD
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857304; cv=none; b=IkcoOmFwQojKgbnBfje69NWcl9ghfjU4aWWE4msZv41ekuGxCgm/DLMEh54AwvEGgutAkcoDtsiCNijKuwcwfJBo5MAl/t40hR1+wK2iMH8dpPyjrgGiTjhxSMxBaoA6QgLHigFtWm4zliXB9HjZnMJelYqoJBT3Ehi0V7xDrCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857304; c=relaxed/simple;
	bh=nt2OuBqZHp5hH7axLcuK0mwUdCxSdHbJZS+mIKAcLsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FC6bLOY1LtEHtdCKNRpx/MnPhM+rjWiJO5csb6k0mMMSpEI6dODwTlbbkjEuaP1pQeB3FQhACDSS3r3Os7gDaGx529r3+O6AiAI/UH+radQFur12i9Mxhg7kb9Fz8XckwSV4FuGBf2BnMyeZNI13nAPhl1pNCLHYywnWksbLlas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIvOqMg/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5XuHgVx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB5N5YW1480220
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 10:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XnsQW66caqXufoMpzSwV48sl
	9poFeXZWxE6EhNbsFGo=; b=DIvOqMg/j4o8p8Jh+0Ml0onPKA+ziJUpqm1vCl7S
	5RJ3Jgno0xpZC1U0O3hA+7rQlbjCw5WF8EFdVhkOb8XghrkgX4eGPrv8SnfzrE4A
	pzWWOA1HIstFREM5w2N7wQtIL9KhkkZp+i8QZFaGznT61FmxGQaxSDgbZg7qOjvc
	3i05V9bTxS7o8vWESorApfmHYq5XV5eemwEA2ghCq5rh/YQ5FRQhx2VckdaR9TQT
	IHvAjJrSb8QW1k6RPXNCRjDn3MkbwwCmbj0JT4KHPKsaR4FYjFZKJkkbSmm0PflH
	JgZ8v7kkJl7mY631iytf2BMr4NOxL5m+tkjNmyCMLA3r+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxxu8vpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 10:35:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed846ac283so19541451cf.0
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 02:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762857301; x=1763462101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnsQW66caqXufoMpzSwV48sl9poFeXZWxE6EhNbsFGo=;
        b=h5XuHgVxf7OrQWHIYHpvxLyfIJf7HUQEUEYNaP6sVG2A9DybxLX5lhqlN2JujIwu1w
         UJ8YO82ypxuHQXrYtChjts9OOUwweqY/YvEFIYHl8KodE6wGDvfLyM6yoOTK3tIxXmiP
         127NC4YCMuIZ4/o909/dr1RAxIUZiny6RybMlP2idazt8Kvq2HNY4oTi8/TYbGJTVI07
         +HT5oKzJKszG4rkTxW3rzVIYxO7wtjGT4qNtq0Mwsl+yCNk6eyCwEBG2QST6cnGsVufl
         7UiaEBGSjJhVaTsv8qd/EcX7CsvHXgt11Di34KVSYYpzCTEK2LQKBflFxxgaMzgFS4Zf
         bnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857301; x=1763462101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnsQW66caqXufoMpzSwV48sl9poFeXZWxE6EhNbsFGo=;
        b=g/zWRl2jEesl3G9Jw4omQjYWkxp1o9ORCtp7OxKAUehbfUFcLojJO66rGA59mrrcBz
         U2RtnVp54YuwaJMoZAVx8z8HQ2DyJ9z1hW5ipLfjbfM2veMq8arDsLDRa4mlaHASwx0f
         FqeBWtQHSjduqFoL2Ggtu7itrJ8xAHUtDapWWaRzIfvf1B7JumZTq/XgLpXAwQ/00Hi1
         RxJdB2fQP77IVZHV3hbwMwi9D530Llq/fykeDx9abumOOLXKl2lnxAsyWBO5/1kC6/4p
         rBJBaQTtZ7eHSevUhfHoVrEU2ei5Kpk9Z/Vuc/QN8tQ0qVB/xSjPb7RMj5dSAIEZMKNm
         Ch8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQfUu0PGH9pPaTuR7gayZuvxRjNfhkw0Cec6Tpg09coosq+DS2tdTnPPUd+ouZZKPNfmcOKAIYrp8u3CQcvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6G6vDTfj9Z9V62eAHAU5kuZihMMsX69lU993+3V3aTSuMWWR0
	XXF7wD1yedM8BRfcVvXr9g68iLxeYRbgDSmt3rZ2/hfDVGSKNMFL1PjCu7py7P8S0HfeskKhl4Q
	i4b4KwIjgk11+5lt3Y39uaeD6DfpnY/VwLvW+O2IWIeQ8VeFqwtmSv5KgXO2RlDxTctM61w==
X-Gm-Gg: ASbGnctBRco50fNJLuLthe5FLFwuTimYO3brFb/IuRm60l+SzyV4foRgHglT/pS4ZXR
	kg1QdGdZnSzDkkc+1vSn1QH/2TLSBw83AwN8Y9LZrw5GZbwzNpdVg2hWEdwyM0uXV7kUvSp/y/j
	e7KQvXc+jXJN9ivv8ONo+WOHnHlM1DTCwz32qaR0oCi2FeyzbPve+qsRFtEoZ2hK7LMJf0BeQqO
	tjkDWp1FtJlB/ZBant/zoQdI/1SaTbLTnlGhmpsNTvOlwJHk3l8Tw/vKXpIwcz315ejMo5Bac0W
	UC53DQFBE4qP3qwXDH7nNZvyWfci713p5p+f1jssRhXLPUl3OKy2dmVgv3g1qc73OEyQlYsM9mN
	PrPlG58BSEKpSVD7OzNlOrxpijQhXQ1U3Yj9ohIF0PRzPLKxjJCvINyh3S+dijvgzw5c4qzQ6Co
	2nXUaKrz0E0lao
X-Received: by 2002:ac8:57d3:0:b0:4d3:7e:d6ca with SMTP id d75a77b69052e-4edcaae2a7dmr34490621cf.17.1762857301534;
        Tue, 11 Nov 2025 02:35:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiGtMsuu9Xc/SbeRo73UYbs3e6EgEQ47a2+DT57DOTLHsjZhT0aojIkqiON+9jG7zGA4OGTQ==
X-Received: by 2002:ac8:57d3:0:b0:4d3:7e:d6ca with SMTP id d75a77b69052e-4edcaae2a7dmr34490351cf.17.1762857301054;
        Tue, 11 Nov 2025 02:35:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0787c8sm44320541fa.16.2025.11.11.02.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:35:00 -0800 (PST)
Date: Tue, 11 Nov 2025 12:34:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <56aqammkwte3tcdzni2unufjp4t4yaqazzdkigrwqsxp3ghcqe@ppe2pjwg3hrl>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
 <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4MiBTYWx0ZWRfX/niD+hUwVE+l
 DP2lShPuMF2JlSuKhjnSrfDVntSYCCrIaeh+gCCLAlqlDI7HtFJU3H2+yL57JUWlbKgbFt/1VGq
 /aXS1RuQ6NfBY2BkAJWhyc+ByD3mBRHWQbbdO9RNIuHlYwXYpQcjZ00StCTQ6AvurFmb3135RON
 7rQZVgMwkYf4/Btzoq5GBOWaK2qwUxwq6qzvbfbV1ykWXX2dCkSluuGFHqbIxWclmQe6k7F7mSm
 k3dm2Cb3salHI5WCAArQoB6A7XPsRpkddZB+/BK5nS5ccNNaaQU2ECmjsE8oQSPlQ+3IBsw7MOc
 BFBtrGd2zNkK/BnK98+JcA77i0PBIkgNKiZPT8miP5z63L5np8b1vQHRygHFCeoL8+7z4GkQmcO
 aF4hfVWEeYsitacG+eTvveco6AjOrw==
X-Proofpoint-GUID: HsvZ5tPUjr2Frdrfi9UqHls4QFCQ2MiW
X-Proofpoint-ORIG-GUID: HsvZ5tPUjr2Frdrfi9UqHls4QFCQ2MiW
X-Authority-Analysis: v=2.4 cv=TfObdBQh c=1 sm=1 tr=0 ts=69131156 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=uckhTH-Ed0y2VRs-pC8A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110082

On Tue, Nov 11, 2025 at 10:51:43AM +0530, Pavan Kondeti wrote:
> On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
> > On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
> > > > +static void qcom_scm_gunyah_wdt_free(void *data)
> > > > +{
> > > > +	struct platform_device *gunyah_wdt_dev = data;
> > > > +
> > > > +	platform_device_unregister(gunyah_wdt_dev);
> > > > +}
> > > > +
> > > > +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> > > > +{
> > > > +	struct platform_device *gunyah_wdt_dev;
> > > > +	struct device_node *np;
> > > > +	bool of_wdt_available;
> > > > +	int i;
> > > > +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
> > > 
> > > static const?
> > > 
> > > > +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> > > > +	static const char * const of_wdt_compatible[] = {
> > > > +		"qcom,kpss-wdt",
> > > > +		"arm,sbsa-gwdt",
> > > > +	};
> > > > +
> > > > +	/* Bail out if we are not running under Gunyah */
> > > > +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> > > > +		return;
> > > 
> > > This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
> > > 
> > 
> > Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
> > 
> 
> Dmitry / Bjorn,
> 
> We are debating on this internally on how to resolve this dependency
> 
> - QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
>   QCOM_SCM compilation than what it is today.
> 
> - Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver 
> 
> - Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
>   for any of the functions defined in drivers/firmware/smccc/smccc.c
> 
> We are trending towards the first option above. Please let us know if
> you think otherwise.

The same as before: 'select HAVE_ARM_SMCCC_DISCOVERY'.

-- 
With best wishes
Dmitry

