Return-Path: <linux-watchdog+bounces-4554-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 273A7C4EC28
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Nov 2025 16:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A89B1892616
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Nov 2025 15:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A256363C47;
	Tue, 11 Nov 2025 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3Js7F6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U62phOnO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A54332EBF
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874252; cv=none; b=N3ztxMg4DR7D7QcOZnB/iLghpkO5NMaWVAFS8A6eYReoPcthLWRRFiQFyGOe3LAy5RYOuL6eNSmx8/QEbtoxgGNvnv3Cs4VnQ5UX4gz9G/KfLfHEieSAaF2QuoIXshraZuvJtvRWA76joZDj91qXsulkk+uamlvRu4l4Uk0BiUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874252; c=relaxed/simple;
	bh=cFy0eFg9xDDoKIoAJXk7rXcmERhFHYornb1ZkaEXq3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPiYBP+SgJJ2q8bw4yjXKBFCym+kLA2fwqrM0bNgnhK76FwAaKHBYYfSmOF5+C9M8iEdfjxtFRTyBX5Acj30FPHORjBUx0HRliCdgS1KDE6rmXkE5pdTPFjmtDPTEV8JjASxdXgBzZdSCCeP9GSstuN93RvJ4q8GuLWO7e6M8+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3Js7F6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U62phOnO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABCm8D62540304
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 15:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=buvjHKf1PuojEb0LL8OChGCz
	Fc+8Z+ETH0y8puXDv2E=; b=m3Js7F6MX4JTJ5p181DnQgJ5Cvhn/zG7DsTxhAeC
	FxQm212gEw/Vsy8Pq0sEJekPimwf/841aal6eZeoKSX4cusDkYdwXMcYWJRPwIVJ
	fi8nLd4KI7P2FA87Z+rdseDJen79CyFBYdVuzie7LlReZBnnXWPpnVjPYTaiHi9i
	Zz3DCmEus7wv7r2AcpwHnazjYhPhqdcQ3Nwsf19z/yh+EeW89KY1x+gSRrEfOrrs
	7G6wv4eqh4FxDnyLCgxjoBr774OethJDdoqt7w1ESKSud4RUqRGAIYiL+if5U7bS
	fa6IS/HEWNLtKaPM7zMbNSN3ZobFxRZiBaMGXOXMZsD1gw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac5fggdmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 15:17:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b25c61abe2so1107770685a.1
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 07:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762874249; x=1763479049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=buvjHKf1PuojEb0LL8OChGCzFc+8Z+ETH0y8puXDv2E=;
        b=U62phOnO3vhhl+rwphs2/lQwzMWlJhD8YcHkSHW2hQTnD/GrIja3IFqgft6Kf6H+2o
         x+fVhvR52ODasW6m3VbBlLECgV/y9KgPZg+VkqMHPcNWBcbi9BHNBsn0j2kKiinFuVKP
         Gx5s9XH4Cp8/kv9cjS8doT+7MRWS0+xDIj+LnRLnARO8CRf/BogHIe1z9cZWwkuF++S+
         R2fcz2Xu1AcTRoYRUbqLHbseNZTIY5y2aYMwE33V8pJLxqhDMCGYLTBEvZik71eipbrC
         JS87Cwx5R/URUV6NILE5WdDfBUXRifBygPrepy+oZ8nlIuJMyjBUBc2VeQj56CBIinoi
         61AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874249; x=1763479049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buvjHKf1PuojEb0LL8OChGCzFc+8Z+ETH0y8puXDv2E=;
        b=TFXb1HPOSYG80sQ77iPeta+sX69UZ+7t29MqAsD7Wy3k9vRq8rzPlDeLX04O/e81R/
         0iEnfGx5hHNEuJ+3sDFwOe8QAzAM3Kmr3+nVTVlNPV3FbfjILuYM7I9zG5Cqhruj4r0z
         jexH/98fSbmFX/rfsLDe5e9gRdCCd/NJRWePkEsE4eA0zRdCy9ThzSbrNrklR3TP/q2J
         U5I0P7MDfQR4gVpbghb2I27h3jJdMbQYZCJqJoN9eFVr1ne7/y6qhaXXcj8pPsCfM30+
         WEHWkHz+Ssmx29Llg6iUg3PI7Bene+gnqVJKVd2kmDV6gm6kvHabKjDGNm3Qgzah2Yzk
         C2qg==
X-Forwarded-Encrypted: i=1; AJvYcCW+AEbq0mMrfqXZF4ibTzCbsH4LAzDCuHgEz5XVEYov9o8OSqJ1g9Ml43AH+I/IOEqmJHmQt/rTTZDvEjwObA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4v+4BEj3Ljfa7CgO45qNcQEZBy0wyr0xhhRlBszHE9Ve+01E1
	WORfmmPn75jEnSXlgnfbAYGGZL04odSlgZYX8e3+yg8O6djFYavjCd+BrvJeDNMQXtBA8lCIKZ0
	wvni6Fl7WReXSvd1CJvopQlKPljBtZWKJ9//0weY4IB27YKdVEbK/Uoiyw+4knw6NmMoN1w==
X-Gm-Gg: ASbGnctSnu3r83lfVj2bgDCMiEUUAtV0hH5AntnNxN4MPIyjXkevhBJz5aKrVHQDOKh
	rsLmCyL41IQUwj6+IzwX3VxzkItzkLJDHdmbTrI7043hGXaEi7jWD+A7ysgyBczEtXHHk0b+2dO
	XtJzPT1Em5PGSlb/diUEtMCiTcEOZIzmLHpNUIPJctrD4SKyt3IGGPFsWmeaVO6/AN2C+9Cpi7+
	XcdGL/8qF6fGEJZhQci0oadb+UKsVPTfY+OgGJckb7qFLKihqlNwBd/A1eXTqI/U5X5c2oXwz/M
	LW0VkCMFVDaJOo6stPUsAzjapU+/y6GqelfABu2q4tV7p0EdeakQSm34P51tgZhIBS8ix+l12Aw
	cDT5ixPXH1spZvAVvEJRye5Q7dx359AdiLy8kSCC4fo3a3onmw/475LLX9dmNAuAxDHZrspZYdI
	GWwq+jmwbUhVa9
X-Received: by 2002:a05:6102:3049:b0:5db:f031:84c4 with SMTP id ada2fe7eead31-5ddc475a644mr4906839137.28.1762873558379;
        Tue, 11 Nov 2025 07:05:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBi5EEv+B0IsCeVwFzn6W4s25mfl4zEj5ZMKHk6DJoUZfUdNO357NnBjPHCLbXMVUYW8rT4w==
X-Received: by 2002:a05:6102:3049:b0:5db:f031:84c4 with SMTP id ada2fe7eead31-5ddc475a644mr4906761137.28.1762873557845;
        Tue, 11 Nov 2025 07:05:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944faba465sm4795599e87.98.2025.11.11.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:05:57 -0800 (PST)
Date: Tue, 11 Nov 2025 17:05:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <nkh73mo4h5kj2lrz7paop7fn3ow2itxl5vh43muw6n5dxgmco3@tgvbmdxhbiqo>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
 <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
 <56aqammkwte3tcdzni2unufjp4t4yaqazzdkigrwqsxp3ghcqe@ppe2pjwg3hrl>
 <60583236-692f-4605-9f56-f7dadb46558d@kernel.org>
 <zbwcg5pkdspkcnvaitac6y5iko346qyuzuipqhkoedcaqm2dpa@zmszuwhm5q7z>
 <6bebcf6c-9328-4cd6-b77c-a147338d607a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bebcf6c-9328-4cd6-b77c-a147338d607a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9F5-fwfUNSN9cBXIoNP7Xu3AgikDgJ7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEyMyBTYWx0ZWRfX2taPKLWk/K8d
 1REYuoUe9buwwMlcryw8yeXKrDZ9nsBv3MwC9gu3MiUUVqNTibLa+iCZAIPa+h7LrUSQs6sIhIC
 0T6QCdlJ/k+U0ZMVuSOQ2WUm6Neus/+b+2FtuwALFFr+i6xA0HSHzw41nMuVx8XLtiqouYDX5dN
 e6Z9dUfgTNLHZ3iXVDDHdtbWvXW497WqQ6liCcAkgFB6wwbPTHBIsRJnm4UhRPbx5tHt+lneNc7
 LA02rFT+98NNaYHKSEvzidJBCzKfKc9i/H8bNkm7MFE346IJ/kIM4PMll7eiQ80kGN146dkMN1O
 9GpDMQUQLSWd6pHv2tYriWHx4B4gX9HC4cGM6J6PI4PHQI5Teo2qkTFr+ioMKy0OLAYbXMYNMRp
 bf4U6Md9X2Ve9IbZsg8Ru5bfHFBAlw==
X-Authority-Analysis: v=2.4 cv=B5u0EetM c=1 sm=1 tr=0 ts=69135389 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VuFkkUr2qAWs9GA4iUwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9F5-fwfUNSN9cBXIoNP7Xu3AgikDgJ7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110123

On Tue, Nov 11, 2025 at 07:30:59PM +0530, Hrishabh Rajput wrote:
> 
> On 11/11/2025 5:52 PM, Dmitry Baryshkov wrote:
> > On Tue, Nov 11, 2025 at 11:41:51AM +0100, Krzysztof Kozlowski wrote:
> > > On 11/11/2025 11:34, Dmitry Baryshkov wrote:
> > > > On Tue, Nov 11, 2025 at 10:51:43AM +0530, Pavan Kondeti wrote:
> > > > > On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
> > > > > > On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > +static void qcom_scm_gunyah_wdt_free(void *data)
> > > > > > > > +{
> > > > > > > > +	struct platform_device *gunyah_wdt_dev = data;
> > > > > > > > +
> > > > > > > > +	platform_device_unregister(gunyah_wdt_dev);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> > > > > > > > +{
> > > > > > > > +	struct platform_device *gunyah_wdt_dev;
> > > > > > > > +	struct device_node *np;
> > > > > > > > +	bool of_wdt_available;
> > > > > > > > +	int i;
> > > > > > > > +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
> > > > > > > static const?
> > > > > > > 
> > > > > > > > +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> > > > > > > > +	static const char * const of_wdt_compatible[] = {
> > > > > > > > +		"qcom,kpss-wdt",
> > > > > > > > +		"arm,sbsa-gwdt",
> > > > > > > > +	};
> > > > > > > > +
> > > > > > > > +	/* Bail out if we are not running under Gunyah */
> > > > > > > > +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> > > > > > > > +		return;
> > > > > > > This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
> > > > > > > 
> > > > > > Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
> > > > > > 
> > > > > Dmitry / Bjorn,
> > > > > 
> > > > > We are debating on this internally on how to resolve this dependency
> > > > > 
> > > > > - QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
> > > > >    QCOM_SCM compilation than what it is today.
> > > > > 
> > > > > - Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver
> > > > > 
> > > > > - Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
> > > > >    for any of the functions defined in drivers/firmware/smccc/smccc.c
> > > > > 
> > > > > We are trending towards the first option above. Please let us know if
> > > > > you think otherwise.
> > > > The same as before: 'select HAVE_ARM_SMCCC_DISCOVERY'.
> > > HAVE_ARM_SMCCC_DISCOVERY has a dependency which is not always selected
> > > (e.g. ARM32), thus selecting it might lead to warnings of unmet
> > > dependencies.
> > Then `if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY))` might be a good
> > option here (and depend on GICv3 selecting it).
> 
> 
> Thanks a lot Dmitry, wemade the change below and compile tested on various
> architectures (ARM64, ARM32, x86, PowerPC, RISC-V and MIPS) and it was
> success.
> 
> We will include it in our next patch version, if there are no further
> concerns.
> 
> }; /* Bail out if we are not running under Gunyah */ - if
> (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid)) + if
> (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) || +
> !arm_smccc_hypervisor_has_uuid(&gunyah_uuid)) return; /*

Unreadable. Don't you read what you are sending?

-- 
With best wishes
Dmitry

