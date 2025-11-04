Return-Path: <linux-watchdog+bounces-4507-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236DC2F2A8
	for <lists+linux-watchdog@lfdr.de>; Tue, 04 Nov 2025 04:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F4A3B8312
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Nov 2025 03:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2712989B0;
	Tue,  4 Nov 2025 03:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMY5XL7f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZ2lCjP9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C5286890
	for <linux-watchdog@vger.kernel.org>; Tue,  4 Nov 2025 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762227039; cv=none; b=i8s0kLq3fGhSTO7uvRO/GdAu10lVJ+VX0rfSGLwvMneE45aNWXmcZsEwkUBuziYQH/a9TGnjOsbOrr8eQJ7lKL0Pafs7P77FTJA+RVSYHLYrrxRfrkLE7ky3RAoHpw9F1KHXA171RCnfioV2qC6ZKpM5YvDe2u7mj9rxQQnO43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762227039; c=relaxed/simple;
	bh=BlSk3g/qmv69Aqy08a9H0y9SJtoy4sGuPi5gwuM79B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojVjlyfnXtev+6sOCreNFUH5SeDw+klQFrfU50l4wFWyUautQEEL9MSsdbrvUGXPC+2bM0tmDrEn3ljjW4VGKCgIPGB0351UuDA+kPULfOpH17k0RdaPANA2G0NQv6dgRrYcaLQ2bq77qgX6m+X9FyVSs6XJtPMJWEjd7OVQRT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMY5XL7f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZ2lCjP9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H33j73595213
	for <linux-watchdog@vger.kernel.org>; Tue, 4 Nov 2025 03:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aKRlnIEjZ1vQhOJXUwZiC+b+
	tF0FUi5RTLlNjrfPLQ8=; b=DMY5XL7fkmJjHz5/cfERKpBEAgRRAWN7k4FDzq8Q
	LtTX9vfaeQBbDYs69EpHcTiwfc+LH2UfbPfW2ZIlsCWwZ1cNloGrMR+rnWJDy+it
	6tDscjvGJy4DVfsbJqsH1DdM1BUxUHOdDHzq3y6p0Y0ebVu8ouIQv/gh895sK8TM
	VY28Ow5glaKWua5RtcexvxpSk6YPPtWHfl54pMbb5JCA83qWzXqQSRGS5mkJ0dsW
	BsPoE+Lmy+0b2KgdM8h9bCaah8oN/HeIakYCUbBbUrl3F/6DkEkXKYmRn6sLYT7c
	7EfXKeviDSTLYpC3QXRi7vNpKdeyQxoiGgGGT0SjoF83Cg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70exhgkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 04 Nov 2025 03:30:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33da21394adso6078199a91.1
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Nov 2025 19:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762227035; x=1762831835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aKRlnIEjZ1vQhOJXUwZiC+b+tF0FUi5RTLlNjrfPLQ8=;
        b=JZ2lCjP95wd+RrTboYo9Q493lor/yMXHwr5WFgjVIFH6LNkMD0yE4FHDxoqVfmKLaF
         2ozn7Diwv/TpHTPuc3rLGKQq3COVFXI3T40tMjVyOYkAJWXCsBjluHjTmoJ7u4Sn/t7G
         GDwz/ewjCW/ArxraJ0wq2vgR5XVte96n/NwGXMycmF7jb3zgRK+QtB/wz1Gjrx7yHEjT
         6lHP+dGV1qOHaWluMma81uEKKOk/SUI+J71oSEBDayUQrm+hZpxciOg2sUW2WidA+Vxt
         VvA5Jm0kQEKQi8NGLHAvhAOd7fJkrbD/kYB4Ye/prsU6EiyYvQbYDXr9p4pR7lu1qIiN
         xyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762227035; x=1762831835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKRlnIEjZ1vQhOJXUwZiC+b+tF0FUi5RTLlNjrfPLQ8=;
        b=TmP9AwGbtuan5/X11r6/IpyoxFZ3TA83eUVkpiCoflIsuSUKpa8JBTLuPXJqItWDtY
         sWb6gXPAr4iPXxAONzIEE4y08Ng/orrZ+viC4MTeGOS2RlYmomu0Tw+gHgW8tKwvXpVP
         ow+92BrXdkTgHRkecbmQG9QwX+BwjeVpDm5xWaQd3kmbRTh9QYvZUFqxEVn1XdjA2ocV
         sNeMBkSdlatILV398vjZBX84mmZV+l9XhrgTysduPZyx1P4jFpm95Is+fhIbcLTdnVTU
         5vJ7dJ8tsL6z5+g80XGB1zJWf3tE0HpPL7qGa4rObe6kYuILhYChX8xXit+8ldJ7nF+k
         zunQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy595d4/vniXWsHYWLg28y3aK5sIl29Mzf7/C46ZVrSV/kTX2yPv19rcUiZ9sqZtWJU3I51h/s2erlWkGtHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBjot8GtA+X8T1W7MD9FlBfIx2ZM/Qnvm6iDT36BwRPeMsCQHH
	Q3l6xidB0iFutGLyXbLENTlGti4ES1/jvawnenoq1kZ8zn7EZaIHgqTutxk2H5jg8Be3fGSGm2b
	kMTVDKcBElv4SucJubH2yxGT9enoOcwl9HJSBtiqHtQRYbWtHW2wiKMnw1lBI/haYIQ3k5Q==
X-Gm-Gg: ASbGncsD2+VCZWIqraNcYZdIb0alMdcPaO9w85/hf/je+JIz9CIQPjXz93GnSr47ND+
	JovKkxmCwxp6Fou+AirJCmfO3hXPrP9xJqy96eZn0pTbz4nYKv5fxgjfX450DHttSQWZhSIm/pe
	kNN2+TuZ25hBzUJkrFM+6ahbDM70+pfTdo05y2gIbkajp5LcWA8N1Je3pFvZhgX0971zjAfhcDA
	kno2NsnRgPmc29sPyAtHZIvc8MusixBpqKiXCJyzgccaAAbZQuaqcKqydROjnrF8vOC3F8TqwBG
	09D9NARjCWxOIsaiDGIHDrZH+WHc4+q8adYem1ponGeQQoZTbCSNUBnlC/aj+lys1eRh6V9a0iq
	6MdcDpzAglYdrcDXouPU92vR5RCiy9OKI
X-Received: by 2002:a17:90b:3d8f:b0:340:f05a:3ed1 with SMTP id 98e67ed59e1d1-340f05a40bamr9318465a91.21.1762227034834;
        Mon, 03 Nov 2025 19:30:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJt+3mR9cCrponHqIjyBb39wA61XEC1qVOkrzh6B9Q27iV/RhmQUZTE7F/v9v66nMik1499g==
X-Received: by 2002:a17:90b:3d8f:b0:340:f05a:3ed1 with SMTP id 98e67ed59e1d1-340f05a40bamr9318414a91.21.1762227034250;
        Mon, 03 Nov 2025 19:30:34 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417bcca63dsm364697a91.4.2025.11.03.19.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 19:30:33 -0800 (PST)
Date: Tue, 4 Nov 2025 09:00:27 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <599188b5-cd2e-4667-a91d-04cbdd62cecb@quicinc.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
 <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>
 <abicharluq6bm7gbngkbdc2hobcfifcmazh7oukcoufsrpcpse@ml2wccwe6s7i>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abicharluq6bm7gbngkbdc2hobcfifcmazh7oukcoufsrpcpse@ml2wccwe6s7i>
X-Authority-Analysis: v=2.4 cv=APHuRV3Y c=1 sm=1 tr=0 ts=6909735c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=LARJouCqKqH4ZFREdpwA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: R1I3NEkql_La2JEoYsnxCfCOwh4-h_27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAyNiBTYWx0ZWRfXzKFL+pB3Vc6I
 yKcOUhGqcwYeSibitDALfEyylVBbth9LJ63fSZbWvfmO604NmIoYLlOMFSkzECvMoyTgC44Hiio
 uem5YUwCwiy0LLfEeBWrKtMsTqz1SRwnclgLw8+RrJab09Fp/G5FGrtorv6LP+5r7KdLpM1ihfj
 zTkOeylhF+OiEGu/8AUTQEocu707uKHU6ihVTlMnDpql5IcB13c5qazasxz0Ozfx5fs/OBoClhY
 xUqnUXdTo1a4YH7zE9flNkDi3o0dbZOQdsJA1mSK4qRqyaet61uq/J+1lYwl2zdNMiTq3EFjLHm
 LPMH9huraQRLImZiH73Z7JlLefMcjozJFENPER349joG/a2HKQVRImWuPLjEq2EB+b4Kq6HE4bR
 ewoa56wTdtnZQo3K/XRT+f0EZUqVHw==
X-Proofpoint-ORIG-GUID: R1I3NEkql_La2JEoYsnxCfCOwh4-h_27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040026

On Mon, Nov 03, 2025 at 07:01:51PM -0600, Bjorn Andersson wrote:
> On Mon, Nov 03, 2025 at 04:03:44PM +0530, Hrishabh Rajput wrote:
> > 
> > On 11/2/2025 12:15 AM, Bjorn Andersson wrote:
> > > On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
> > > > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > 
> > > > To restrict gunyah watchdog initialization to Qualcomm platforms,
> > > > register the watchdog device in the SMEM driver.
> > > > 
> > > > When Gunyah is not present or Gunyah emulates MMIO-based
> > > > watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
> > > > present in the devicetree. If none of these device nodes are detected,
> > > > we register the SMC-based Gunyah watchdog device.
> > > > 
> > > > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > > > ---
> > > >   drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
> > > >   1 file changed, 37 insertions(+)
> > > > 
> > > > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > > > index cf425930539e..40e4749fab02 100644
> > > > --- a/drivers/soc/qcom/smem.c
> > > > +++ b/drivers/soc/qcom/smem.c
> > > > @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
> > > >   	return 0;
> > > >   }
> > > > +static int register_gunyah_wdt_device(void)
> > > > +{
> > > > +	struct platform_device *gunyah_wdt_dev;
> > > > +	struct device_node *np;
> > > > +
> > > > +	/*
> > > > +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
> > > > +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
> > > > +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
> > > > +	 * the case.
> > > E.g. qcom-apq8064.dtsi doesn't define either qcom,kpss-wdt, nor
> > > arm,sbsa-gwdt, does that imply that it implements the Gunyah watchdog?
> > 
> > 
> > It doesn't implement Gunyah watchdog. For platforms like these we've kept a
> > STATUS SMC call in the gunyah_wdt_probe().
> > 
> 
> I think it would be good to make that call before registering the
> platform driver.

Did you mean platform device here? Becase we don't want the gunayh-wdt
module to do anything other than registering the platform driver on
platforms other than qcom.

> 
> > The SMC Call is expected to fail on platforms which do not have support for
> > SMC based Gunyah watchdog, which in turn will fail the probe.
> > 
> 
> Perhaps I'm missing something, just looked quickly and it's been a while
> since I looked at this code, but you're making a HVC (or SMC) call with
> the function:
> 
>   ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, ARM_SMCCC_OWNER_VENDOR_HYP, 6)
> 
> which doesn't look unique to Gunyah in my eyes.
> 
> If I read correctly, the ARM_SMCCC_SMC_32 is the only bit (literally)
> that differentiates this from being a __vgic_v3_get_gic_config() call in
> KVM, just as an example.
> 

Yes, you are right. This SMCC falls under ARM_SMCCC_OWNER_VENDOR_HYP
space, so it would behave differently on different hypervisors.

Please let me know what you think about this **defensive** approach.

- Move the Gunyah platform device registration to SCM driver.
- Checks to be done before registering the device
  - Make ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID SMC [1] to verify that we are
    running under gunyah
  - check for the other wdt devices like kpss, sbsa in dT

ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID SMC will not be supported by all
versions of Gunyah, but atleast it would confirm the definitive presence
of Gunyah.

[1]
https://lore.kernel.org/all/20240222-gunyah-v17-4-1e9da6763d38@quicinc.com/

