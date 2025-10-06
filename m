Return-Path: <linux-watchdog+bounces-4330-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B4CBBE2E0
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 15:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EE77189807E
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 13:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1922D0637;
	Mon,  6 Oct 2025 13:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pj+bBsVa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2E02D060E
	for <linux-watchdog@vger.kernel.org>; Mon,  6 Oct 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759757177; cv=none; b=adQhhqAdhjoUMeLFxm6pS8gyEUkbEHvPXM7dz9tiSZuftc6oyqePb7uYEyVUHwKgnPNgJF/kLHNFbq/cM3AFyJSK+ghJ4On4eIsAbKPvzctC24QwUxZF32DBsEnfwYaQ1mnME3V6Z23SsaAhIEDl8cnfJYOwsrH8Tnfz0G+47g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759757177; c=relaxed/simple;
	bh=MT9skSBafU/OO6TyPXQDKc8LwQvb8rKcFgEGPquoaCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suibK5xOVlKGBThhKmJXcy1R9jqqVyf5h8VOfE/xIh8thPL9aaBre/MeWth1VNHtCsD9+T22XqQZctZGqUYZIbJB7ORcbjZSlF/Foyjtyh+trTcv1WO/4dxWjrhvFqDliP8vbI53qIuyiPy1fSEWpseccXr8EgLmNWmOFol36kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pj+bBsVa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NLPRd026488
	for <linux-watchdog@vger.kernel.org>; Mon, 6 Oct 2025 13:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N6ypGwDaGlhrK6ZG0i30/Y0b
	yq9GzIhyKl5ZGLSoyg8=; b=Pj+bBsVa5wdki1EC9M/Y/T2PXX2Nn0MrZz3/MJFP
	8ODFOvriAzyVcNtwGjIvxQoANbtaKse6qUooemhy/RqvMcoUslVCM+t8L/OWc6Dk
	mmnsnplzFmw0sOWgV8BcYhtuuft4mJSAZaa6UuYU64Cxo1tA+thDg10WuD5DYA+D
	ShBBedvpkOc2BPIi+NeEohURSC9tA+lcQrRzqv9WMWeQSA/GX1NPpYKIgoy5uDD3
	9vEPi4hAYBCtRuP+C68uS+05T6wlMtNON68nwFlDo3Oo+uHQAs2GTU/iRnvckP8N
	Zc4rbShhk6MOqt5JINFdFsGlErCfHDN8WRItOpYM0WmWHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1kw66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 13:26:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6ee6so63853765ad.0
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 06:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759757174; x=1760361974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6ypGwDaGlhrK6ZG0i30/Y0byq9GzIhyKl5ZGLSoyg8=;
        b=JeGqsVxzguTVrsFgcjG2qhtBjMZrG5H2ECwF18XRSL5XUfuT5N3YwVeqPZ9JwSJe4s
         60txtz+s6ZO8NU6o72TjabVErDFJjrCW97ISphfgQ7Otck4mSQeqjyzYWhGC8jvTNjuY
         Io96anDuUUzGgBqtYQKo+4dopDNlBsdwV4NyoT9+rDuUsHMIjKVHFkz9K0egcScC0dAD
         u9IFDD5ZNeKiktY5iFZRYg4NeA5EhyeZqOA6xGgida2CD2I3tYSeCnZHIMjBivcM67DS
         +cFeWB/VWonSaXfFDCzr2z+r/46vxO8miURApJ/TXiyN+CMhSN1v85cEWe58TYf7wwIO
         0SAA==
X-Forwarded-Encrypted: i=1; AJvYcCUD4U+x1neLycS/UZfZ+wsoEiJtRNJU3kNJhrhNHiIEmUFOlp+s7Vaxmaw2nR6oD3VF4JToPYlC8EoC4GSuFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNgQsb1HEWIV+r5ZBVfaoIfwb/F19N7ZqfUJV3PEsH2Xfjb+O/
	fQwiCNJ+K3jhe4fPIRgi5HYgdmUXJqIBSes15i442t1sv0J/A+cjooOTm7gKCZP0qWvTMJSCdxA
	IwZVO/vbCLpQwBSOuVqCec0HajqU8tsiABCOEjUb4q3pAe9qIcVDMEO/jrwxKbKNAg+JJ6Q==
X-Gm-Gg: ASbGnctW05kzxl5LVHB9nwjUFhVPNTn16IRXhNzO/V0HlnkEzP1GpdF81Cgdm2V6F/7
	GAm2twTGbWavGlUwfud4VJQ2vHuUaPEEydO6Z6ktPgpoiqIUwLcbUQ0sDvanQRdTa3FX6v6QUj/
	VwQW75lx3H5gyUsUbcyeVr/tMWR4AESE6QBMpJfxcwLWUSK3xYt258aVRt9XCXXQN+3W/xOPOHM
	JAOLaxOhBb1omDgzYH70KPah3E8Bsar55HRZxY7Ztx+K0f+BSwmTlmYekDaVXCP19QIhFQVUgdW
	X6rFgw/0K28wMcTmgtbmh70+VFTbLEcrSr2lH8rz/ng/6PFSmY6b8P9O0RAk2LYOmWFFgOHdibN
	Zhl4=
X-Received: by 2002:a17:903:fa7:b0:26d:72f8:8d0a with SMTP id d9443c01a7336-28e9a546107mr157426365ad.12.1759757173866;
        Mon, 06 Oct 2025 06:26:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFCL9tEe0bUa/fsgaePc+hDb76CeL+9swiqptY7n40Bj6hjQm6jXL8R3obANVcrWL1Rq7DAw==
X-Received: by 2002:a17:903:fa7:b0:26d:72f8:8d0a with SMTP id d9443c01a7336-28e9a546107mr157426005ad.12.1759757173382;
        Mon, 06 Oct 2025 06:26:13 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d126ad9sm133655095ad.45.2025.10.06.06.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:26:13 -0700 (PDT)
Date: Mon, 6 Oct 2025 18:56:06 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        hrishabh.rajput@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <491de94c-e3c5-4f81-8e1a-82596413cede@quicinc.com>
References: <20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com>
 <3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org>
 <a7633abf-0005-423b-b152-e8c70aa5c27a@quicinc.com>
 <b94d8ca3-af58-4a78-9a5a-12e3db0bf75f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b94d8ca3-af58-4a78-9a5a-12e3db0bf75f@kernel.org>
X-Proofpoint-GUID: djs5xjXQR8kI0dcgOrxjZHMRFcbwui4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX0st6WFOVCjVj
 aXa6/7y3wGpQAtdxWr+NlwbzipUzw8bE6xSWd7mLwnHJiDQNb/U7OOfiJPFHN+rz6tTOvnNj8yr
 Yxy/xoU7rNlAX97STlDXWXyak8PA3TUpF4PeINwdiCK5NkJPpiablaGvvgIoSQKTg49HRDztaIW
 HKWY9a6SHE2WOKbj/JMB9iiQ1yWCAg6hxIr8fifOmMh4C93FCYY7a/p1jWjYm86glkybgmXPnXR
 U2UP/5jWLpRa20aDIasc/eyMcCd6eAJK0+ZIXJ1K9H2s8V1li2eJwzW385olMEEvmhEY5b7DPcJ
 eE52RVbOv0cvlpPOmnh8d95lhLjVE7ZDeJ4de4U052zB19fR+O8UWT0rlv/sXZ1+J3bgi+XUwdY
 beHDYRji8Ikq4e5PvdHP6aqpEy6ang==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e3c376 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=Jc37b2qoeXC1bbEKzk4A:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: djs5xjXQR8kI0dcgOrxjZHMRFcbwui4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On Mon, Oct 06, 2025 at 10:03:59PM +0900, Krzysztof Kozlowski wrote:
> On 06/10/2025 19:03, Pavan Kondeti wrote:
> > On Mon, Oct 06, 2025 at 05:56:42PM +0900, Krzysztof Kozlowski wrote:
> >> On 06/10/2025 16:37, Hrishabh Rajput via B4 Relay wrote:
> >>> +
> >>> +static int __init gunyah_wdt_init(void)
> >>> +{
> >>> +	struct arm_smccc_res res;
> >>> +	struct watchdog_device *wdd;
> >>> +	struct device_node *np;
> >>> +	int ret;
> >>> +
> >>> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
> >>> +	if (np) {
> >>> +		of_node_put(np);
> >>> +		return -ENODEV;
> >>> +	}
> >>> +
> >>> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
> >>> +	if (np) {
> >>> +		of_node_put(np);
> >>> +		return -ENODEV;
> >>> +	}
> >>> +
> >>> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
> >>> +	if (ret)
> >>> +		return -ENODEV;
> >>
> >> No, your hypervisor driver (which you have) should start the module via
> >> adding platform/aux/something devices. Now you are running this on every
> >> machine, which is clearly wrong...
> >>
> > 
> > This is a good point. Thanks for bringing it up. We don't have a
> > hypervisor glue driver (yet!) that can add an aux device. Based on v1
> > feedback, we would like to be a standalone module that can self discover
> > gunyah hypercall interface.
> > 
> > Currently this driver depends on ARCH_QCOM || COMPILE_TEST. So,
> > technically this can be built and loaded on all non-Qualcomm machines.
> 
> 
> Not technically, but practically. We do not make single-platform kernels
> anymore, it's not 2010. Entire arm64 is multiarch.

Thanks, I understand that we build single kernel image that works across
machines. However, I wonder do all modules built say from
arch/arm64/configs/defconfig gets loaded? Usually, the modules
corresponding to drivers for which devices are registered (modalias
based) gets loaded, correct? In this case, we don't have a device, so
there may be an explicit rule to load this module. I totally get your
point on why it would be preferred to make this module active only on
QCOM platform.

> 
> > 
> > We can make the STATUS SMCC before looking for the other watchdog
> > devices and fail early.
> > 
> > Our Gunyah glue driver [1] do make SMCC call to establish that we
> > are actually a guest under Gunyah. Since our intention here is to
> > support watchdog on as many as platform as possible, it is better not to
> > tie this with glue driver and make it a stand alone and self discovery
> > module.
> 
> 
> I think you should have only one driver pinging for Gunyah, so glue
> driver or this. Not both. If you add such SMC here, then how do you
> determine the platform in the glue driver? Via DT? Then DT supersedes this.

The SMCC that this module would be using is specific to Gunyah watchdog
interface. So there is no real dependency w/ Gunyah glue driver. I
understand your point that there should not be two drivers probing the
watchdog.

> 
> > 
> > If this is not an acceptable solution (Please let us know), we can find other 
> > ways to limit it to only work on Qualcomm machines. For ex: Socinfo
> > platform device is added from SMEM driver which make it only probed on 
> > Qualcomm machines. We can look into this. 
> 
> 
> To me socinfo feels even better. That way only, really only qcom devices
> will execute this SMC.
> 

Ok, we will look into this.

Thanks,
Pavan

