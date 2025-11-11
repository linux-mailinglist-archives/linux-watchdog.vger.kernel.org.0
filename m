Return-Path: <linux-watchdog+bounces-4559-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BC693C4FFAE
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Nov 2025 23:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 497CF34B771
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Nov 2025 22:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103052D2390;
	Tue, 11 Nov 2025 22:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOiKgAiC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3l7D3u7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFD226AA94
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 22:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762900612; cv=none; b=bTkZEaqBCPK4I73fac/uotm2oeLj7mzM8V/c1+YX0QB8FijCTP7uI62Zx9xyB60Yml1cFydH2kQYnn9aSZ81FsGENB5UsXD28V3J6UZpj0T/2MhKDh1gT5e3ibv3Aj3GN2PoLzfvlU0LtvRh8MJPc0506qCTS8dpci8aPSYIR+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762900612; c=relaxed/simple;
	bh=3fWmHOxKq6K4JtRy+o9ZjHgsvWeln5n+UKsL57Cgy7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTnmmka8K9kZiHH+uwxaulVyAidODmbZB8xx4nJV7/2wXldAUNRpeH5kCh/RUz0WNPHy9TIT3jpFwA7+mxbRimPlgd+5g6V946jD5s89h/Nw+59dA/DFf6vJUf2l0OKKXGUZPD0GPbyoW8mOs4jT2T/XGwBOPZy4XxbehBGn418=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOiKgAiC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3l7D3u7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABJCnJ22027672
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 22:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Lf6DQCQZs5RnAciE19Kjze4
	UBC2DxH59loEQV5g5TU=; b=mOiKgAiCxzdd4FakiuLjRz2h7/qxXjx90rWbvij4
	FqzZsf+mhRmII3Bb3cRM1NCXInGVLYI2UMSn4G4hAJvBo2Emj6s0WbratxlLGyTe
	9MelY/O0Y1LlKn8W6VDnfCngqhHHGwiv07nb1dshvD4HcSl2NwSAwLfIPptLm6f3
	jVJaU3yVqJW/UtyZAGIC+kGXT+87arRIDx57aGSmzpNU4BCCGhVnoq11gkoCPAeH
	FouABTASk7fdwVqbkjLvj47woUDRItwBoH9OcIjDN3RTXJZzTsgDL0ublc4ARlkR
	P3Da9iiOdomLbkG+C1JfqQm+AKZNr3nar2D8qMd6HguNXQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxqw2vn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 22:36:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf9548410so5688811cf.1
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 14:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762900608; x=1763505408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Lf6DQCQZs5RnAciE19Kjze4UBC2DxH59loEQV5g5TU=;
        b=G3l7D3u7KxKc/GWZ+7Jrn7HmNTvUkjCl9bI/Av4UPdZihSPTPG6nqao5w5OVSpXibs
         rwOSc+0nHCIoavh/TAkLdmzNUwi12777eskaKXnWRhLR9D3HTmhsljygzecTsSsDujQc
         b+ZsW2bX+rLh/DW4sg3eFaZacnRE9CTaTr/9Bg3roiRoH3jvfGnpweHYwln3yovYV+gQ
         30CEwiFl1bxq3jSIcR60Mq8QPnTuzvv4EUUjQBpqSrLHdZBdBEJdflRRVCNcRea94pA7
         kZfg8Q9nYQYfYO+OA5Awdy6VXjl8f+V9EKAuS5U79COfEwHqOre/otozHANV3AC1ee5t
         xYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762900608; x=1763505408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Lf6DQCQZs5RnAciE19Kjze4UBC2DxH59loEQV5g5TU=;
        b=iSzhopF/t/2Kt45kklrWL9C+8CKhXAy3dWKcKwzKMHQo/lBco35Js/ie63XpVoN/Z+
         d09RqBv25cppDHYbH7hQMMHb+LKG2AMMtkrb4y5TZms7xHqB//Ugn6dMiyH87MCSqrCX
         Das0kh1S63HV3Pqd3uKZNDFwY0ezgJZYBA2BRcti+rxBQjoOGmsx5Bw/BTM1tMOnfZxE
         DeOW/Tj56PMiYLD7WS3YljMxpnmI2a4Dl9i5pE9RrlQ2Wb9eE/pnG/9INEYkFfVHiRNl
         X8BboGUIYMRkGP0d2hsQpdoD8KRCd2wbc+xA3xrYC31IZk+6fxP6X3JO6/vuRAT/jgil
         KV9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxye1fuXWzXdEcMGFSzw5tCgHgcwz9QPG9zHEzCEXtdUh5rPz6xzUbHaenYQ6mZaMD2f90FSL/j3AfnLx8pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygIr6ol60rLAvD7UUkpd8VEIMf0A0/51D1MRYmJ+wVMTZSNHLv
	14+dG/VnGolvCYG5Mq+W+nWqJQtQrfRnE4a4LBaX4k69wGQAWnF6yElrFAnFBXZWslhWJAQCXN3
	JqFYTmMaYXe0Rhba0IM/wqjHdQqEkXZMKfb7G9RarHjAK0D3hPhusfDXBc79ULApLtp+dSw==
X-Gm-Gg: ASbGncsVfqsMr6KcvnyyI+FC43Tp2e5YXiLq98/xKV28qKA6cYtjxCxKIzW6JNpo4eg
	vF1BRyY8fZLtjM1d+J7/ttvF7dkfVxdfu2/YJIaX3OB6njwI3rSNywDwkePPyLigoSsp2Sl2cuD
	sCOH2PlbXC/IaQe6r8nuJ6KzbTcFT7IuzKgN8i7tcoZWqhfU2j3eA7Q2+MiBIkiJYeOo6ajvHgr
	Cc/pTrwb7MiVccQQDxeZkMIljDBRejWpF3R0h/uIqQ9k/mSBxI1m400wEIW4W16Sv1fb/Vk0bvx
	02vFm1+jRCfMJ4IeMrK77D9o6GTfY5FXo4uuIy8OgMD4hecfg7KVsxzOBTRQVQQ49L3pXPgZmaM
	lv2/94p00O/siJvLhDBhM4J5ocsxMlOPjl+i6xG9A6TGNTgU2ysUue9iEIJ3IwjVECNjTRb24Aw
	/EV5EOfM3AwDyB
X-Received: by 2002:a05:622a:3d0:b0:4ed:1bba:f935 with SMTP id d75a77b69052e-4eddbd9cc3fmr10605331cf.57.1762900608390;
        Tue, 11 Nov 2025 14:36:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbTefJ2z0M7lHf60BOYoHNgvXkw0SsQwfZl0cycXZYQVG4QHwOCTgRxy1jxcyu/3c+cxh1RQ==
X-Received: by 2002:a05:622a:3d0:b0:4ed:1bba:f935 with SMTP id d75a77b69052e-4eddbd9cc3fmr10605091cf.57.1762900607944;
        Tue, 11 Nov 2025 14:36:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b7600sm5330869e87.57.2025.11.11.14.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 14:36:47 -0800 (PST)
Date: Wed, 12 Nov 2025 00:36:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, hrishabh.rajput@oss.qualcomm.com,
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
Message-ID: <oeg7s3g2zbctft72p3tsdgdlsgbxqnbwk6dj2loiio4fbazfbn@fsgj2kijxb75>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
 <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
 <rt777beinysf5nuy57frn7okwglsl77xqikmvobao32bznhnkf@mzg243ddzlpl>
 <b7ed3445-d004-4c15-b8f8-b2f92a621471@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7ed3445-d004-4c15-b8f8-b2f92a621471@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE4NSBTYWx0ZWRfXyYY43ierKRSE
 YmcXj9Jq+Eta/GiaaUR/k/fcUTpS0TorqUlzho16LXklKloynmjV55mA7uncofORAv9VgZzC3iG
 RqV8qYyngmyB8Xvctrs9GgXF3mLEyyRAkBIcbFX9VvT5qNfGl45abR6fncUGI0VeqoztpGI4F6d
 g7UfRMDpxcGvIrmrPy2DhSEHTJRtN1lvsX81A6bvm65kko4uOFNqL4Y4x82e7aL1jYeH+IVvgiF
 8LPIxkXhm3ov1J+qp0eMqF5fwZJEKv3938ecr4l3h34iNktyWgLQ//itFaOBvwSm0foFc1AfwdA
 gZwHh7TNqC7T0Iz8594vprpDY4Y6d6U1TRtWxfUHPwn4IXW5yDjbtsoURsGZq4Zh0TR29dif902
 deN34HLIw3QdR8uApOFQQ0FHX4hLTw==
X-Proofpoint-GUID: Ao7e83Lyo-vAEYVL1XlBjZf0Ow3r4EZD
X-Proofpoint-ORIG-GUID: Ao7e83Lyo-vAEYVL1XlBjZf0Ow3r4EZD
X-Authority-Analysis: v=2.4 cv=CeIFJbrl c=1 sm=1 tr=0 ts=6913ba81 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=XerNsCJ_4FoK1Q8j8m4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110185

On Tue, Nov 11, 2025 at 10:31:10PM +0530, Pavan Kondeti wrote:
> On Tue, Nov 11, 2025 at 10:38:27AM -0600, Bjorn Andersson wrote:
> > On Tue, Nov 11, 2025 at 10:51:43AM +0530, Pavan Kondeti wrote:
> > > On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
> > > > On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
> > > > > > +static void qcom_scm_gunyah_wdt_free(void *data)
> > > > > > +{
> > > > > > +	struct platform_device *gunyah_wdt_dev = data;
> > > > > > +
> > > > > > +	platform_device_unregister(gunyah_wdt_dev);
> > > > > > +}
> > > > > > +
> > > > > > +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> > > > > > +{
> > > > > > +	struct platform_device *gunyah_wdt_dev;
> > > > > > +	struct device_node *np;
> > > > > > +	bool of_wdt_available;
> > > > > > +	int i;
> > > > > > +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
> > > > > 
> > > > > static const?
> > > > > 
> > > > > > +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> > > > > > +	static const char * const of_wdt_compatible[] = {
> > > > > > +		"qcom,kpss-wdt",
> > > > > > +		"arm,sbsa-gwdt",
> > > > > > +	};
> > > > > > +
> > > > > > +	/* Bail out if we are not running under Gunyah */
> > > > > > +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> > > > > > +		return;
> > > > > 
> > > > > This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
> > > > > 
> > > > 
> > > > Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
> > > > 
> > > 
> > > Dmitry / Bjorn,
> > > 
> > > We are debating on this internally on how to resolve this dependency
> > > 
> > > - QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
> > >   QCOM_SCM compilation than what it is today.
> > 
> > What does that imply? What is the actual impact? (Do I need to go read
> > the dependency tree myself?)
> 
> Actually, I misunderstood how QCOM_SCM driver is enabled. It is being
> selected by other drivers which needs functionality provided by QCOM_SCM
> driver. So adding HAVE_ARM_SMCCC_DISCOVERY dependency does not make much
> sense. Sorry, I should have done my homework properly. I was carried
> away with `select` vs `depends on` approach. 
> 
> > 
> > > 
> > > - Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver 
> > > 
> > > - Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
> > >   for any of the functions defined in drivers/firmware/smccc/smccc.c
> > > 
> > > We are trending towards the first option above. Please let us know if
> > > you think otherwise.
> > 
> > What is this trend driven by? Is it coin toss or is there a reason? My
> > gut feeling is trending towards one of the latter two options...
> 
> Thanks, we are going with #ifdefry around the new code that is added by
> this patch.

It's preferred to use if(IS_ENABLED()) rather than #ifdef.

> 
> > 
> > But you're effectively asking us to go research these three options,
> > determine the pros/cons and then tell you what we think, at which point I
> > presume you will tell us what you think about each option.
> > 
> > It would be better if you made a suggestion and told us why you think
> > this is the best choice - then we can either agree with your reasoning,
> > or choose to ask more questions or do some research.
> > 
> 
> Understood. I will keep this in mind while presenting choices from now
> onwards.

-- 
With best wishes
Dmitry

